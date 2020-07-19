class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:membership_number, :name, :name_kana, :birthday, :sex, :phonenumber, :email, :password])
  end
end
