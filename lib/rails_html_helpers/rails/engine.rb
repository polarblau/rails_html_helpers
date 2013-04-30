module RailsHTMLHelpers
  module Rails
    class Engine < ::Rails::Engine

      initializer 'rails_html_helpers.helper' do |app|
        ActionController::Base.helper(RailsHTMLHelpers::Rails::Helpers)
      end

    end
  end
end
