module Datagaze::Routes
  class << self

    # Not implemented yet

    def annotate_all_routes
     
    end

    private

    def routes_file_path
     Rails.root.join("config/routes")
    end

    def routes
      @routes ||= `rails routes`.chomp("\n").split(/\n/, -1)
    end

  end
end