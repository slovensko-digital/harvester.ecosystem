namespace :itms do
  desc 'Sync all itms data'
  task 'all:sync' => :environment do
    Itms::FetchAllData.perform_all
  end
end
