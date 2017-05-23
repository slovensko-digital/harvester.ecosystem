namespace :ra do
  desc 'Sync batches for address register'
  task sync: :environment do
    Ra::SyncChangesBatchesJob.perform_async
  end

  desc "Import initial batch for address register"
  task init: :environment do
    Ra::FetchInitialBatchJob.perform_async
  end
end
