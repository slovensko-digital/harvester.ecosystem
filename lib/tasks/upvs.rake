namespace :upvs do
  desc 'Sync public authority eDesks'
  task 'public_authority_edesks:sync' => :environment do
    Upvs::FindPublicAuthorityEdeskListJob.perform_later
  end

  desc 'Sync services with forms list'
  task 'services_with_forms:sync' => :environment do
    Upvs::FindServicesWithFormsListJob.perform_later
  end
end
