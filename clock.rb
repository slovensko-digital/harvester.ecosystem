require_relative 'config/application'

Rails.application.load_tasks

module Clockwork
  handler do |job|
    Rake::Task[job].reenable
    Rake::Task[job].invoke
  end

  every(1.day, 'ra:sync', at: '5:00')
end
