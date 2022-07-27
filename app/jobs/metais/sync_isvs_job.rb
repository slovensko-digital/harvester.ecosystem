class Metais::SyncIsvsJob < ApplicationJob
  queue_as :metais

  def perform(project, json)
    isvs_uuid = json['ci']['uuid']
    isvs = project.isvs.find_or_create_by(uuid: isvs_uuid)
    isvs.raw_data = json.to_json
    isvs.save!

    Metais::SyncRelatedDocumentsJob.perform_later(isvs)

    parse_isvs(isvs)
  end

  private

  def parse_isvs(isvs)
    # TODO: parse isvs
  end
end
