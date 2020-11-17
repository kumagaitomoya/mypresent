class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:attendance_id,:name,:postal_code,:prefecture_id,:municipality,:address,:building_name,:allergy])
  end

end
