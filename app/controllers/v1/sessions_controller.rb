class V1::SessionsController < ApplicationController
    def create 
        @user = User.where(email: params[:email]).first

        if @user && @user.authenticate(params[:password])
            login(@user)
            # maybe add a token?
            #render json: {token: '123', status: :created}
            render :create, status: :created
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