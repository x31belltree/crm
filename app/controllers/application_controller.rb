class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_current_user
      @current_user = User.find_by(id: session[:user_id])
    end
    
    protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      # アカウント編集の時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
