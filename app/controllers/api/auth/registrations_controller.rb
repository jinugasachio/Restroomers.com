class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

    def sign_up_params
      params.permit(:nickname, :email, :image, :password, :password_confirmation)
    end

    def account_update_params
      params.permit(:nickname, :email, :image)
    end
end
