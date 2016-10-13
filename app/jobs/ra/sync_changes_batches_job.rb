class Ra::SyncChangesBatchesJob
  include Sidekiq::Worker
  include Sidekiq::Symbols

  sidekiq_options queue: 'ra'

  sidekiq_retry_in do |_count|
    1.day.to_i
  end

  CHANGES_BATCHES_URL = 'https://data.gov.sk/dataset/register-adries-zmenove-davky'

  def perform(downloader: Faraday, job: ::Ra::FetchChangesBatchJob)
    html = downloader.get(CHANGES_BATCHES_URL).body
    doc = Nokogiri::HTML(html)
    doc.css('#dataset-resources .resource-item').each do |item|
      next unless item.at_css('a.heading')[:title].include?('Zmenová dávka č. ')

      download_link = item.at_css('a.resource-url-analytics')
      url = download_link[:href].gsub('https://MODMCASV222/', 'https://data.gov.sk/')
      job.perform_async(url)
    end
  end
end
