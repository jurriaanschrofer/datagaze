module Datagaze::Models
  class << self

    # The method that creates all annotations
    def annotate_all_models
      collect_all_models.each do |model, atts|
        annotate_one_model(model: model, **atts.slice(:path, :table_name) )
      end
    end

    # The method that removes all annotations, if desired
    def clean_all_annotations
      collect_all_models.each do |model, atts|
        clean_one_model(model: model, **atts.slice(:path) )
      end
    end

    private

    def annotate_one_model(model:, path:, table_name:)
      @model      = model
      @path       = path
      @table_name = suf_and_prefixed_table_name(table_name)
      @columns    = columns
      @contents   = generate_schema_information

      File.open(path, "w+") { _1 << @contents }
    end

    def suf_and_prefixed_table_name(table_name)
      [@model.table_name_prefix, table_name, @model.table_name_suffix].join
    end

    def clean_one_model(model:, path:)
      @model    = model
      @path     = path
      @contents = exisiting_file_contents

      File.open(path, "w+") { _1 << @contents }
    end

    def generate_schema_information
      begin_of_comment        + 
      informational_header    + 
      table_information       + 
      end_of_comment          + 
      exisiting_file_contents
    end

    def columns
      columns = ApplicationRecord.connection.columns(@table_name)
      sort_columns(columns)
    end

    def sort_columns(columns)
      columns.sort_by { _1.name }
    end

    def table_information
      @columns.map { column_information(_1) }.join("\n")
    end

    def exisiting_file_contents
      file_contents = File.read(@path)
      remove_previous_annotation(file_contents)
    end

    def remove_previous_annotation(file_contents)
      annotation_matcher = /^=begin\n\n== Schema information.*^?(?>=end\n)/m
      file_contents.gsub(annotation_matcher, '')
    end

  end
end
