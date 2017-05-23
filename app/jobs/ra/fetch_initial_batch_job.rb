require 'zip'
require 'harvester_utils/downloader'

module Ra
  class FetchInitialBatchJob
    include Sidekiq::Worker
    include Sidekiq::Symbols

    sidekiq_options queue: 'ra'

    INITIAL_BATCH_URL = 'https://data.gov.sk/dataset/de3dd18f-9124-4acb-ae00-705555332256/resource/a904effb-7c5c-43ce-8c59-270932e6a19a/download/bbpradavkainit20151009prod.zip'

    def perform
      initial_batch_zip = HarvesterUtils::Downloader.download_file(INITIAL_BATCH_URL)

      for_each_file_in_zip(initial_batch_zip.path) do |extracted_file|
        Ra::FetchChangesBatchJob.new.perform_on_file(extracted_file)
      end
    end

    private

    def for_each_file_in_zip(zip_file, &block)
      Zip::File.open(zip_file) do |zip_file|
        zip_file.each do |entry|
          logger.debug "Extracting #{entry.name}"

          extracted_file = Tempfile.new(entry.name)
          begin
            extracted_file.binmode
            extracted_file.write(entry.get_input_stream.read)

            yield extracted_file
          ensure
             extracted_file.close
             extracted_file.unlink
          end
        end
      end
    end
  end
end
