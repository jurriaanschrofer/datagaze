module Datagaze::Models
  class << self

    def collect_all_models     
      
      models = ApplicationRecord.descendants.select { |model| !model.abstract_class? }
      
      models.map do |model|
       
        path, line_no = ApplicationRecord.const_source_location(model.to_s)
        table_name    = model.table_name
        
        { model => { path: path, table_name: table_name } }

      end.reduce(&:merge)

    end

  end
end