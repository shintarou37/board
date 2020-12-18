class ApplicationController < ActionController::Base
  before_action :configre_permitted_parameters, if: :devise_controller?
  
  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduce,:image,:GitHub,:age_id,:prefecture_id,:language_id,:type_id,:goal_id])
  end

end
