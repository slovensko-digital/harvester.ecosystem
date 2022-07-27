require 'faraday'

class Metais::SyncAllProjectsJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/cmdb/read/cilistfiltered'

  def perform()
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1
    projects = []

    loop do
      response = conn.post('', '{"filter":{"type":["Projekt"],"metaAttributes":{"state":["DRAFT"]}},"page":%{page},"perpage":5}' % {page: page_number}, 'Content-Type' => 'application/json')
      projects.concat(JSON.parse(response.body)&.dig('configurationItemSet'))

      page_number >= JSON.parse(response.body)['pagination']['totalPages'] ? break : page_number += 1
    end

    projects.each do |project|
      Metais::SyncProjectJob.perform_later(project)
    end
  end
end
