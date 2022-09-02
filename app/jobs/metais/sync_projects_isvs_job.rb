require 'faraday'

class Metais::SyncProjectsIsvsJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/cmdb/read/relations/neighbourswithallrels/'
  RELATED_ISVS_REQUEST_TEMPLATE = '%{uuid}?ciTypes=ISVS&page=1&perPage=5'

  def perform(project)
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1

    begin
      response = conn.get(RELATED_ISVS_REQUEST_TEMPLATE % {uuid: project.uuid}, nil, 'Content-Type' => 'application/json')
      parsed_json = JSON.parse(response.body)
      isvs = parsed_json&.dig('ciWithRels')
      return unless isvs

      isvs.each do |i|
        Metais::SyncIsvsJob.perform_later(project, i)
      end

      page_number += 1
    end while page_number <= parsed_json['pagination']['totalPages']
  end
end
