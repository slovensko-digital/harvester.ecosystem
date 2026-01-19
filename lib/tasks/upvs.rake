namespace :upvs do
  desc 'Sync all public authority eDesks'
  task 'public_authority_edesks:sync' => :environment do
    Upvs::FetchPublicAuthorityEdesksListJob.perform_later
  end

  desc 'Sync public authority eDesks'
  task 'public_authority_active_edesks:sync' => :environment do
    Upvs::FindPublicAuthorityActiveEdesksListJob.perform_later
  end

  desc 'Sync services with forms list'
  task 'services_with_forms:sync' => :environment do
    Upvs::FindServicesWithFormsListJob.perform_later
  end
end
