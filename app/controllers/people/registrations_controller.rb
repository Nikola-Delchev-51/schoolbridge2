class People::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource
    resource.build_address        # ← ensures nested fields render
    respond_with resource
  end
end