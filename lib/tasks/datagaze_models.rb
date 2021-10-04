
require_relative "../datagaze/models/models"

desc "Adds a table representation to your model files."
task :datagaze_models do
  Datagaze::Models.annotate_all_models
end

desc "Removes the table representation from your model files."
task :datagaze_remove do
  Datagaze::Models.clean_all_annotations
end

