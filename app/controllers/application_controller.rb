class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

 protected
  def configure_permitted_parameters
    added_attrs = [ :name, :name_kana, :email, :password, :password_confirmation, :membership_number_id, :birthday, :sex, :phonenumber]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end
end
