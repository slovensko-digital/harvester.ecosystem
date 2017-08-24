namespace :upvs do
  desc 'Sync public authority edesks'
  task 'public_authority_edesks:sync' => :environment do
    Upvs::FindPublicAuthorityEdeskListJob.perform_later
  end
end
