require 'faraday'

class Metais::SyncRelatedDocumentsJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/cmdb/read/relations/neighbours/'
  
  def perform(parent)
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1

    begin
      response = conn.post(parent.uuid, '{"neighboursFilter":{"usageType":["system","application"],"metaAttributes":{"state":["DRAFT"]},"relType":["CI_HAS_DOCUMENT","Dokument_sa_tyka_KRIS","CONTROL_HAS_DOCUMENT","PROJECT_HAS_DOCUMENT"],"ciType":["Dokument"]},"page":%{page},"perpage":100}' % {page: page_number}, 'Content-Type' => 'application/json')
      documents = JSON.parse(response.body)['fromNodes']&.dig('neighbourPairs')

      documents.each do |document|
        Metais::SyncDocumentJob.perform_later(parent, document)
      end

      page_number += 1
    end while page_number <= JSON.parse(response.body)['fromNodes']['pagination']['totalPages']
  end
end
