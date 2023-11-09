module Upvs
  class ResourceNotFoundError < RuntimeError
  end

  class FindPublicAuthorityActiveEdeskListJob < ApplicationJob
    queue_as :upvs

    DATASET_URL = 'https://data.gov.sk/dataset/zoznam-ovm-s-aktivovanou-elektronickou-schrankou'

    def perform(downloader: HarvesterUtils::Downloader, fetch_job: Upvs::FetchPublicAuthorityActiveEdesksListJob)
      html = downloader.download(DATASET_URL)
      doc = Nokogiri::HTML.parse(html)
      resource_link = doc.search('.resource-item .dropdown-menu a').detect do |a|
        a['href'].include?('.csv')
      end

      if resource_link
        fetch_job.perform_later(resource_link['href'])
      else
        raise ResourceNotFoundError
      end

      # TODO add heartbeat
      BetterUptimeApi.ping_heartbeat('UPVS_FIND_ACTIVE_EDESKS')
    end
  end
end
