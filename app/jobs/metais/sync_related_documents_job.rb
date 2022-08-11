require 'faraday'

class Metais::SyncRelatedDocumentsJob < ApplicationJob
  queue_as :metais

  API_ENDPOINT = 'https://metais.vicepremier.gov.sk/cmdb/read/relations/neighbours/'
  RELATED_DOCUMENTS_REQUEST_TEMPLATE = '{"neighboursFilter":{"usageType":["system","application"],"metaAttributes":{"state":["DRAFT"]},"relType":["CI_HAS_DOCUMENT","Dokument_sa_tyka_KRIS","CONTROL_HAS_DOCUMENT","PROJECT_HAS_DOCUMENT"],"ciType":["Dokument"]},"page":%{page},"perpage":100}'
  
  def perform(parent)
    conn = Faraday.new(url: API_ENDPOINT)
    page_number = 1

    begin
      response = conn.post(parent.uuid, RELATED_DOCUMENTS_REQUEST_TEMPLATE % {page: page_number}, 'Content-Type' => 'application/json')
      parsed_json = JSON.parse(response.body)
      documents = parsed_json['fromNodes']&.dig('neighbourPairs')
      return unless documents

      documents.each do |document|
        Metais::SyncDocumentJob.perform_later(parent, document)
      end

      page_number += 1
    end while page_number <= parsed_json['fromNodes']['pagination']['totalPages']
  end
end
