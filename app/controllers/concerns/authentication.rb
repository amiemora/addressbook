module Authentication
    # the purpose of this file is to allow there to be an interface for the user to log in/out
    extend ActiveSupport::Concern
    def authenticate_user!
      unless user_signed_in?
        redirect_to login_path, alert: "You need to login to access that page."
      end
    end
  
    included do
      before_action :current_user
      helper_method :current_user
      helper_method :user_signed_in?
    end
    # set the user ID here
    def login(user)
      reset_session
      session[:current_user_id] = user.id
    end
  
    def logout
      reset_session
    end
  
    def redirect_if_authenticated
      if user_signed_in?
        redirect_to root_path, alert: "You are already logged in."
      end
    end
  
    private
  
    # sets the currrent user logged in
    def current_user
      Current.user ||=
        session[:current_user_id] && User.find_by(id: session[:current_user_id])
    end
    # method that checks if the user is logged in
    def user_signed_in?
      Current.user.present?
    end
  end