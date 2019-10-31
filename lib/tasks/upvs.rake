namespace :upvs do
  desc 'Sync public authority edesks'
  task 'public_authority_edesks:sync' => :environment do
    Upvs::FindPublicAuthorityEdeskListJob.perform_later
  end

  desc 'Sync digital services and forms'
  task 'digital_services_and_forms:sync' => :environment do
    Upvs::FindDigitalServicesAndFormsListJob.perform_later
  end
end
