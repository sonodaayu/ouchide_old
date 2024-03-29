class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

  # ログイン済ユーザーのみにアクセスを許可する
 !

  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?




  def after_sign_in_path_for(resource)
    ouchis_path
  end
  protected
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile])
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile])
  end


end
