=begin 

Instead of using Rails generators to run the gem's installation (and thereby 
requiring a railtie), we simply copy and paste the required file into the
main application's lib directory ourselves. Doing so will add hooks to all
migration rake tasks as provided by rails, effectively running `bundle exec
datagaze models` everytime a database operation is performed.

=end

desc "Install datagaze and let it run on every migration."
task :install do
 
  puts "Datagaze is enabling to automatically run on every future migrations..."

  require './config/environment'

  source_path      = File.expand_path('../templates/datagaze_on_migration.rake', __FILE__)
  destination_path = Rails.root.join('lib/tasks/datagaze_on_migration.rake')

  `cp #{source_path} #{destination_path}`

end

desc "Uninstall datagaze and prevent it from running on every migration."
task :uninstall do

  puts "Datagaze is uninstalling and stops to automatically run on future migrations..."

  require './config/environment'

  installation_path = Rails.root.join('lib/tasks/datagaze_on_migration.rake')

  `rm #{installation_path}`

end
