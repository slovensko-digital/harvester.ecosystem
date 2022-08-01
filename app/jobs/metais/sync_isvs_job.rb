class Metais::SyncIsvsJob < ApplicationJob
  queue_as :metais

  def perform(project, json)
    isvs_uuid = json['ci']['uuid']

    ActiveRecord::Base.transaction do
      isvs = project.isvs.find_or_create_by(uuid: isvs_uuid)
      isvs.raw_data = json.to_json
      parse_isvs(isvs, json)
      isvs.save!

      Metais::SyncRelatedDocumentsJob.perform_later(isvs)
    end
  end

  private

  def parse_isvs(isvs, json)
    # TODO: parse isvs
  end
end
