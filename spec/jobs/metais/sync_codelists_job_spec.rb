

    require 'rails_helper'

    RSpec.describe Metais::SyncCodelistsJob, type: :job do
      describe '#perform' do
        ActiveJob::Base.queue_adapter = :test
    
        it 'queues all metais codelists jobs' do
          subject.perform
    
          expect(Metais::SyncCodelistProgramJob). to have_been_enqueued.exactly(1).times
          expect(Metais::SyncCodelistInvestmentTypeJob). to have_been_enqueued.exactly(1).times
          expect(Metais::SyncCodelistProjectStateJob). to have_been_enqueued.exactly(1).times
          expect(Metais::SyncCodelistProjectPhaseJob). to have_been_enqueued.exactly(1).times
          expect(Metais::SyncCodelistSourceJob). to have_been_enqueued.exactly(1).times
        end
      end
    end
    