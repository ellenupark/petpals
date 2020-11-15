class CallbacksController < Devise::OmniauthCallbacksController
    def github
        #Create new user from provider parameters
        #from_omniauth method defined in user model
        @user = User.from_omniauth(request.env["omniauth.auth"])

        #sign_in_and_redirect method provided by omniauth
        sign_in_and_redirect @user
    end
end