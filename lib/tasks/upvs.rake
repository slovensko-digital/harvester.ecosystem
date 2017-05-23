namespace :upvs do
  desc 'Sync public authority edesks'
  task 'public_authority_edesks:sync' => :environment do
    Upvs::FetchPublicAuthorityEdesksListJob.perform_later
  end
end
