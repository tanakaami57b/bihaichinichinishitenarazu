class ApplicationController < ActionController::Base

  # ログイン必須 & Devise用パラメータ許可
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Devise パラメータの許可設定
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
