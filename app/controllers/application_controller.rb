class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_person!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    added = %i[
      username email forename middle_name surname
      type date_of_birth
      class_cohort_id enrollment_date
      employment_commencement_date salary
      student_id
      address_attributes => [
      :building_number, :street, :postcode, :city, :country
    ]
    ]
    
    devise_parameter_sanitizer.permit(:sign_up, keys: added)
    devise_parameter_sanitizer.permit(:account_update, keys: added)
  end
end
