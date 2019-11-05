class Upvs::FetchServicesWithFormsListJob < ApplicationJob
  queue_as :upvs

  def perform(url, downloader: HarvesterUtils::Downloader)
    csv_file = downloader.download_file(url)
    csv_options = { col_sep: File.open(csv_file) { |f| f.readline }.include?(';') ? ';' : ',', headers: true }

    TemporaryServiceWithForm.transaction do
      TemporaryServiceWithForm.create_table!

      each_row_as_attributes(csv_file, csv_options) do |attributes|
        TemporaryServiceWithForm.find_or_initialize_by(uri: attributes[:uri]).update!(attributes)
      end

      TemporaryServiceWithForm.truncate_source_table!
      TemporaryServiceWithForm.insert_to_source_table!
    end
  end

  class TemporaryServiceWithForm < TemporaryRecord
    def self.source
      Upvs::ServiceWithForm
    end
  end

  private

  def each_row_as_attributes(csv_file, csv_options)
    CSV.foreach(csv_file, csv_options) do |row|
      row = row.to_h.transform_keys { |k| k.to_s }

      yield(
        instance_id: row.fetch('IdServiceInstance'),
        external_code: row.fetch('ExternalCode'),
        meta_is_code: row.fetch('MetaISCode'),
        name: row.fetch('ServiceName'),
        type: row.fetch('ServiceType'),
        uri: row.fetch('ExtId'),
        institution_name: row.fetch('InstitutionName'),
        valid_from: row.fetch('ValidFrom'),
        valid_to: row.fetch('ValidTo'),
        url: row.fetch('ServiceUrl'),
        info_url: row.fetch('ServiceInfoURL'),
        form_url: row.fetch('FormURL'),
        changed_at: row.fetch('LastUpdated')
      )
    end
  end
end
