class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception  
    skip_before_action :verify_authenticity_token

    helper_method :current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
      added_attrs = [:username, :email, :company, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

    # def after_sign_in_path_for(resource)
    #   root_path :protocol => 'http://'
    # end

    def create
      ############################### FORM SUBMIT ################################
      success = verify_recaptcha(action: 'submit', minimum_score: 0.5)
      checkbox_success = verify_recaptcha unless success
      if success || checkbox_success
        # Perform action
      else
        if !success
          @show_checkbox_recaptcha = true
        end
        render 'new'
      end
    end
end
