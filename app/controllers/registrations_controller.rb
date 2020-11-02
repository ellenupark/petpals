class RegistrationsController < Devise::RegistrationsController
  protected
    
  def update_resource(resource, params)
    if current_user.provider == "github"
      params.delete("current_password")
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :city, :state)
    end

    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :username, :city, :state)
    end

end