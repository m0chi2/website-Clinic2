class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Patient)
      patients_homes_path
    elsif resource_or_scope.is_a?(Admin)
      admins_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :membership_number,
      :name,
      :name_kana,
      :birthday,
      :sex,
      :phonenumber,
      :email,
      :password,
    ])
  end
end
