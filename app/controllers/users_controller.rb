class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            log_in_user!(@user)
            redirect_to bands_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user.nil?
            redirect_to new_user_url
        else
            render :show
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
