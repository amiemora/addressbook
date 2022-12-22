class V1::SessionsController < ApplicationController
    def create 
        @user = User.where(email: params[:email]).first

        if @user && @user.authenticate(params[:password])
            login(@user)
            render json: @user.as_json(only: [:id, :email])
        else
            head(:unauthorized)
        end
    end 
    def destroy 
        logout
        redirect_to root_path, notice: "Logged out"
    end 
    private

    def user_params
        params.require(:user).permit(
        :email,
        :password,
        :password_confirmation
        )
    end
end