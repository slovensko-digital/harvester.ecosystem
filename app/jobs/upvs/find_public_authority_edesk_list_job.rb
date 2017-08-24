require 'harvester_utils/downloader'

module Upvs
  class ResourceNotFoundError < RuntimeError
  end

  class FindPublicAuthorityEdeskListJob < ApplicationJob
    queue_as :upvs

    DATASET_URL = 'https://data.gov.sk/dataset/upvs-institucie-so-schrankou'

    def perform(downloader: HarvesterUtils::Downloader, fetch_job: Upvs::FetchPublicAuthorityEdesksListJob)
      html = downloader.download(DATASET_URL)
      doc = Nokogiri::HTML.parse(html)
      doc.search('.resource-item .dropdown-menu a').each do |a|
        if a['href'].include?('.csv')
          fetch_job.perform_later(a['href'])
          return
        end
      end

      raise ResourceNotFoundError
    end
  end
end
