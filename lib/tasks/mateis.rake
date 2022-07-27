namespace :metais do
  desc 'Sync all metais projects'
  task 'sync' => :environment do
    Metais::SyncAllProjects.perform_later
  end
end
  