module Datagaze::Models
  class << self
  
    ColumnPadding = 5
    
    private

    def informational_header
      name_header    = "column_name".ljust(name_column_width)
      type_header    = "column_type".ljust(type_column_width)
      default_header = "column_default".ljust(default_column_width)
      headers        = format_joined_column(name_header + type_header + default_header)
      margin         = "\n\n"
      headers + margin
    end

    def name_column_width  
      [*@columns.map { _1.name.length }, "column_name".length].compact.max + ColumnPadding
    end

    def type_column_width
      [*@columns.map { _1.type.to_s.length }, "column_type".length].compact.max + ColumnPadding      
    end

    def default_column_width
      [*@columns.map { _1.default&.length }, "column_default".length].compact.max + ColumnPadding
    end

    def name_column_value
      (@column.name || "-").ljust(name_column_width)
    end

    def type_column_value
      (@column.type.to_s || "-").ljust(type_column_width)
    end

    def default_column_value
      (@column.default || "-").ljust(default_column_width)
    end

    def column_information(column)
      @column  = column
      contents = name_column_value + type_column_value + default_column_value
      format_joined_column(contents)
    end

    def format_joined_column(column)
      # Remove trailing whitespaces, since many linters will try to remove them and thus make your
      # watchers run wild, when editing hunderds of models simultaneously.
      column.strip
    end

  end
end