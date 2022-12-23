class V1::ApplicationController < ActionController::API
    private

  # Now we need to authorize who can access these views: AUTHORIZE
  # We use this in all our entity controllers in order to only allow a user who is logeed in to have access to the data stored in the DB
  def authenticate
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
  # We create these 2 methods to unify them in sessions/users controller
  def login(user)
    session[:user_id] = user.id
  end
  def logout
    session[:user_id] = nil
  end

  # If the id isnt presetn we return nil
  # If it exists we will return it,  or set it and return it
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end
  # allows us to call this method in our views
  helper_method :current_user
end
