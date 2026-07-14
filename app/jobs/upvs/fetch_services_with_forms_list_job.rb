class Upvs::FetchServicesWithFormsListJob < ApplicationJob
  queue_as :upvs

  def perform(dataset_url, downloader: HarvesterUtils::Downloader)
    zip_file = downloader.download_file(dataset_url)
    csv_file = downloader.extract_csv(zip_file)

    csv_options = {
      encoding: 'UTF-8',
      liberal_parsing: true,
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
    self.inheritance_column = nil

    def self.source
      Upvs::ServiceWithForm
    end
  end

  private

  def each_row_as_attributes(csv_file, csv_options)
    CSV.foreach(csv_file, **csv_options) do |row|
      row = row.to_h.transform_keys { |k| k.to_s.gsub(/\p{Cf}|"/, '') }

      row[row.keys.first]&.sub!(/\A"/, '')
      row[row.keys.last]&.sub!(/"\z/, '')

      row = row.transform_values { |value| value&.gsub(/[\\"]/,'') }
      row = row.transform_values { |v| v == 'NULL' ? nil : v }

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
