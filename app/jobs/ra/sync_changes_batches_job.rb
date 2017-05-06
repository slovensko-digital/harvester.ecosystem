class Ra::SyncChangesBatchesJob
  include Sidekiq::Worker
  include Sidekiq::Symbols

  sidekiq_options queue: 'ra'

  sidekiq_retry_in do |_count|
    1.day.to_i
  end

  CHANGES_BATCHES_URL = 'https://data.gov.sk/dataset/register-adries-zmenove-davky'

  @@downloader = Faraday.new(request: { timeout: 5.minutes.to_i })

  def perform(downloader: @@downloader, job: ::Ra::FetchChangesBatchJob)
    response = downloader.get(CHANGES_BATCHES_URL)

    response.status == 200 || fail("Received non-200 HTTP status: #{response.status}")

    doc = Nokogiri::HTML(response.body)
    doc.css('#dataset-resources .resource-item').each do |item|
      next unless item.at_css('a.heading')[:title].include?('Zmenová dávka č. ')

      download_link = item.at_css('a.resource-url-analytics')
      url = download_link[:href].gsub('https://MODMCASV222/', 'https://data.gov.sk/')
      job.perform_async(url) if should_download_batch?(url)
    end
  end

  def should_download_batch?(batch_url)
    batch_id = batch_url.match(/zmenovadavka(\d+)\.xml$/)[1]
    !Ra::ChangesBatch.exists?(id: batch_id)
  end
end
