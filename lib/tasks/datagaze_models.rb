require_relative "../datagaze/models/models"

desc "Adds a table representation to your model files."
task :datagaze_models do
  puts "Datagaze is adding table representations to your model files..."
  Rails.application.eager_load!
  Datagaze::Models.annotate_all_models
end

desc "Removes the table representation from your model files."
task :datagaze_remove do
  puts "Datagaze is removing table representations from your model files..."
  Rails.application.eager_load!
  Datagaze::Models.clean_all_annotations
end

