require 'faraday'

class Metais::SyncAllProjectsJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/cmdb/read/cilistfiltered'

  def perform()
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1

    begin
      response = conn.post('', '{"filter":{"type":["Projekt"],"metaAttributes":{"state":["DRAFT"]}},"page":%{page},"perpage":5}' % {page: page_number}, 'Content-Type' => 'application/json')
      parsed_json = JSON.parse(response.body)
      projects = parsed_json&.dig('configurationItemSet')

      projects.each do |project|
        Metais::SyncProjectJob.perform_later(project)
      end

      page_number += 1
    end while page_number <= parsed_json['pagination']['totalPages']
  end
end
