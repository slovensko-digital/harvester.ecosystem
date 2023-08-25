class Upvs::FetchServicesWithFormsListJob < ApplicationJob
  queue_as :upvs

  def perform(url, downloader: HarvesterUtils::Downloader)
    csv_file = downloader.download_file(url)

    csv_options = {
      encoding: 'UTF-8',
      col_sep: '","',
      quote_char: "\x00",
      headers: true
    }

    TemporaryServiceWithForm.transaction do
      TemporaryServiceWithForm.create_table!

      each_row_as_attributes(csv_file, csv_options) do |attributes|
        TemporaryServiceWithForm.find_or_initialize_by(instance_id: attributes[:instance_id]).update!(attributes)
      end

      TemporaryServiceWithForm.truncate_source_table!
      TemporaryServiceWithForm.insert_to_source_table!
    end

    BetterUptimeApi.ping_heartbeat('UPVS_FETCH_SERVICES')
  end

  class TemporaryServiceWithForm < TemporaryRecord
    def self.source
      Upvs::ServiceWithForm
    end
  end

  private

  def each_row_as_attributes(csv_file, csv_options)

    CSV.foreach(csv_file, csv_options) do |row|
      row = row.to_h.transform_keys { |k| k.to_s.gsub(/\p{Cf}|"/, '') }

      row[row.keys.first].gsub!(/\A"/, '')
      row[row.keys.last].gsub!(/"\z/, '')

      row = row.to_h.transform_keys { |k| k.to_s }
      row = row.transform_values { |v| v == 'NULL' ? nil : v }
      row = row.transform_values { |value| value.gsub!(/[\\"]/,'') }

      row["IdServiceInstance"], row["ExternalCode"] = row["IdServiceInstance,ExternalCode"].split(',')
      row.delete("IdServiceInstance,ExternalCode")

      row["FormURL;;"] = row["FormURL;;"].gsub!(";;", "")
      row["FormURL"] = row.delete("FormURL;;")

      yield(
        instance_id: row.fetch('IdServiceInstance'),
        external_code: row.fetch('ExternalCode').presence,
        meta_is_code: row.fetch('MetaISCode').presence,
        name: row.fetch('ServiceName').presence,
        type: row.fetch('ServiceType').presence,
        institution_uri: row.fetch('ExtId').presence,
        institution_name: row.fetch('InstitutionName').presence,
        valid_from: row.fetch('ValidFrom').presence,
        valid_to: row.fetch('ValidTo').presence,
        url: row.fetch('ServiceUrl').presence,
        info_url: row.fetch('ServiceInfoURL').presence,
        schema_url: row.fetch('FormURL').presence,
        changed_at: row.fetch('LastUpdated').presence
      )
    end
  end
end
