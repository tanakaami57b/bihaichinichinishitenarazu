class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?
 #ユーザー登録やログイン認証等を使う前に、configure_permitted_parametersメソッドが実行される
  protected
  # 「private」ではなく「protected」にすることで、他のコントローラーからも参照できるようにしている

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
