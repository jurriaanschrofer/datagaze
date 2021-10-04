module Datagaze::Models
  class << self

    private

    def begin_of_comment
      <<~EOL
        =begin

        == Schema information for table '#{@table_name}'

      EOL
    end

    def end_of_comment
    <<~EOL


      =end

      EOL
    end

  end
end