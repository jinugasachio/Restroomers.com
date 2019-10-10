class Api::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # 破壊的メソッドを使うapiコントローラーで下記を記載すると、
  # csrf確認をスキップできる
  skip_before_action :verify_authenticity_token

  private
  def sign_up_params
    params.permit(:nickname, :email, :image, :password, :password_confirmation)
  end

  def account_update_params
    params.permit(:nickname, :email, :image)
  end
end
