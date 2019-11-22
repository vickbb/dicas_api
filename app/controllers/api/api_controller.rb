module Api
  class ApiController < ActionController::Base
    before_action :restrict_access

    private
      def restrict_access
        unless Rails.env.development?
          authenticate_or_request_with_http_token do |token, options|
            ApiKey.exists?(access_token: token)
          end
        end
      end
      
  end
end
