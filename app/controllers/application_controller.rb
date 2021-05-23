class ApplicationController < ActionController::Base
    include Pagy::Backend
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?

    layout :layout_by_resource

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password) }
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password) }
        end

    include Pundit
    
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:alert] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
    end

    def layout_by_resource
        if devise_controller?
          "devise"
        else
          "application"
        end
    end
end
