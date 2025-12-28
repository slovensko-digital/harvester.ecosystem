require 'faraday'

class Upvs::FindPublicAuthorityEdesksListJob < ApplicationJob
  queue_as :upvs

  DATASET_URL = 'https://slovensko.sk/static/zoznam-ovm/zoznam-ovm.csv'

  def perform
    Upvs::FetchPublicAuthorityEdesksListJob.perform_now(DATASET_URL)
  end
end
