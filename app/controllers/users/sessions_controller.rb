class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: "Logged in successfully.",
      user: current_user
    }, status: :ok
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers["Authorization"].split(" ")[1], 
    ENV['DEVISE_JWT_SECRET_KEY']).first
    current_user = User.find(jwt_payload["sub"])

    if current_user 
      render json: {
        message: "Logged out successfully."
      }, status: :ok
    else
      render json: {
        message: "Something went wrong."
      }, status: :bad_request
    end
  end
end
