class ApplicationController < ActionController::Base
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  #privateは記述したコントローラ内でしか参照できないが、protectedは呼び出された他のコントローラからも参照
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
