require_relative 'config/application'

Rails.application.load_tasks

module Clockwork
  handler do |job|
    Rake::Task[job].reenable
    Rake::Task[job].invoke
  end

  every(1.week, 'upvs:public_authority_edesks:sync', at: 'Sunday 4:00')
end
