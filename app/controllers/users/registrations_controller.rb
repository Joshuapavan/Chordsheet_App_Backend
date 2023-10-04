class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private
  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { 
        message: "Signed up successfully.",
        user: resource
         }, status: :created
    else
      render json: { 
        message: "Something went wrong." ,
        errors: resource.errors.full_messages
        }, status: :bad_request
    end
  end
end