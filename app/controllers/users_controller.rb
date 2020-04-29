class UsersController < ApplicationController
  protect_from_forgery

    def user_params
        params.require(:user).permit(:username, :email, :company, :password, :password_confirmation, :remember_me)
    end

    def create
        @user = User.new(params[:user].permit(:username))

        ########################### REGISTRATION ###########################
        recaptcha_valid = verify_recaptcha(model: @user, action: 'registration')
        if recaptcha_valid
          if @user.save
            redirect_to @user
          else
            render 'new'
          end
        else
          render 'new'
        end

        ############################### LOGIN ################################
        success = verify_recaptcha(action: 'login', minimum_score: 0.5)
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

