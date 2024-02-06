class ApplicationController < ActionController::Base
  before_action :basic_auth
  # 上記はポップアップの設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nick_name, :birth_date, :last_name, :first_name, :japanese_first_name,
                                             :japanese_last_name])
  end
end
