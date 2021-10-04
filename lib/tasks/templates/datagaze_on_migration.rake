
# Using an initializtion rake task, this file somehow needs to be copied
# to the main application's app/lib/tasks directory

if Kernel.const_defined?("Rails::Application") && Rails::VERSION::MAJOR >= 6
  
  require "active_record"

  migration_tasks = %w( db:migrate db:migrate:up db:migrate:down db:migrate:reset 
                        db:migrate:redo db:rollback )

  migration_tasks.each do |task|

    next unless Rake::Task.task_defined?(task)
    
    Rake::Task[task].enhance do
      Rake::Task['datagaze_models'].invoke
    end
  end
end