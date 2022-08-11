class Metais::SyncIsvsJob < ApplicationJob
  queue_as :metais

  def perform(project, json)
    isvs_uuid = json['ci']['uuid']

    isvs = project.isvs.find_or_initialize_by(uuid: isvs_uuid)
    process_isvs(isvs, json)

    Metais::SyncRelatedDocumentsJob.perform_later(isvs)
  end

  private

  def process_isvs(isvs, json)
    ActiveRecord::Base.transaction do
      return unless isvs.latest_version.nil? || isvs.latest_version.raw_data != json.to_json
      
      version = isvs.versions.build(raw_data: json.to_json)
      parse_isvs(isvs, json)
      isvs.save!
      version.save!
      isvs.latest_version = version
      isvs.save!
    end
  end

  def parse_isvs(isvs, json)
    # TODO: parse isvs
  end
end
