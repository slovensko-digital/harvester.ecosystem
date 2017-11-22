namespace :itms do
  desc 'Sync all itms data'
  task 'sync' => :environment do
    Itms::SyncAllJob.perform_later
  end

  task 'detect_api_changes' => :environment do
    Itms::DetectApiChangeJob.perform_later
  end
end
