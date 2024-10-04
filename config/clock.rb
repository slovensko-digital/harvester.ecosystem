require_relative 'environment'

Rails.application.load_tasks

module Clockwork
  handler do |job|
    Rake::Task[job].reenable
    Rake::Task[job].invoke
  end

  every(1.week, 'upvs:public_authority_edesks:sync', at: 'Sunday 4:00')
  every(1.week, 'upvs:public_authority_active_edesks:sync', at: 'Sunday 4:00')
  every(1.week, 'upvs:services_with_forms:sync', at: 'Sunday 4:00')

  every(1.day, 'itms:sync', at: '5:00')
  every(1.day, 'itms:detect_api_changes', at: '9:00')

  every(1.day, 'metais:sync_codelists', at: '2:30')
  every(1.day, 'metais:sync', at: '3:00')
end
