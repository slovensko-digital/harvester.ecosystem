require 'faraday'

class Upvs::FindPublicAuthorityActiveEdesksListJob < ApplicationJob
  queue_as :upvs

  SET_URL = 'https://data.gov.sk/set/28c2c7ee-6a43-4746-9e3f-35e977f6f03d'
  BASE_URL = 'https://data.slovensko.sk/api/sparql'

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
      LIMIT 2
    "

    response = Faraday.get(BASE_URL, {query: query})

    if response.success?
      csv_dataset_url = response.body.split("\n")[1..].map(&:strip)
                          .find { |url| Faraday.get(url).headers['Content-Disposition']&.include?('.csv') }

      Upvs::FetchPublicAuthorityActiveEdesksListJob.perform_now(csv_dataset_url) if csv_dataset_url
    else
      raise "Request to find latest dataset URL for set: #{SET_URL} failed with status code #{response.status}"
    end
  end
end
