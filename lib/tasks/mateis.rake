namespace :metais do
  desc 'Sync all metais projects'
  task 'sync' => :environment do
    Metais::SyncAllProjectsJob.perform_later
  end

  desc 'Sync all metais codelists'
  task 'sync_codelists' => :environment do
    Metais::SyncCodelistsJob.perform_later
  end
end
  