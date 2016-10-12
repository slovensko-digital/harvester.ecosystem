namespace :ra do
  desc 'Sync batches for address register'
  task sync: :environment do
    Ra::SyncChangesBatchesJob.perform_async
  end
end
