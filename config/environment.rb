# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Moika::Application.initialize!

module Devise
  module Models
    module Authenticatable
      def find_for_authentication(conditions)
          debugger
        end
    end
  end
end