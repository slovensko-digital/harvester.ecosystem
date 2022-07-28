require 'faraday'

class Metais::SyncProjectsIsvsJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/cmdb/read/relations/neighbourswithallrels/'

  def perform(project)
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1

    begin
      response = conn.get('%{uuid}?ciTypes=ISVS&page=1&perPage=5' % {uuid: project.uuid}, 'Content-Type' => 'application/json')
      isvs = JSON.parse(response.body)&.dig('ciWithRels')

      isvs.each do |i|
        Metais::SyncIsvsJob.perform_later(project, i)
      end

      page_number += 1
    end while page_number <= JSON.parse(response.body)['pagination']['totalPages']
  end
end
