require 'faraday'

class Upvs::FindServicesWithFormsListJob < ApplicationJob
  queue_as :upvs

  SET_URL = 'https://data.gov.sk/set/9eeac271-ae1c-40f8-bb90-7089a9fcb659'
  BASE_URL = 'https://data.slovensko.sk/api/sparql'
  NUMBER_OF_DATASET_FORMATS = 1

  def perform
    query = "
      PREFIX dct: <http://purl.org/dc/terms/>
      PREFIX dcat: <http://www.w3.org/ns/dcat#>
      SELECT ?downloadURL
      WHERE {
        <#{SET_URL}> dct:hasPart ?dataset .
        ?dataset dcat:distribution ?distribution .
        ?dataset dct:issued ?issued .
        ?dataset dct:modified ?modified .
        ?dataset dcat:distribution ?distribution .
        ?distribution dcat:downloadURL ?downloadURL .
      }
      ORDER BY DESC(?modified)
      LIMIT #{NUMBER_OF_DATASET_FORMATS}
    "

    response = Faraday.get(BASE_URL, {query: query})

    if response.success?
      dataset_url = response.body.split("\n")[1..].map(&:strip)
                                                  .find { |url| Faraday.get(url).headers['Content-Disposition']&.include?('.zip') }

      raise "Dataset URL not found in response. Job: Upvs::FindServicesWithFormsListJob" if dataset_url.nil?

      Upvs::FetchServicesWithFormsListJob.perform_now(dataset_url)
    else
      raise "Request to find latest dataset URL for set: #{SET_URL} failed with status code #{response.status}"
    end
  end
end
