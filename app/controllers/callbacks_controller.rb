class CallbacksController < Devise::OmniauthCallbacksController
    #ask for env
    def github
        @user = User.from_omniauth(request.env["omniauth.auth"])

        #sign_in_and_redirect method provided by omniauth
        sign_in_and_redirect @user
    end
end