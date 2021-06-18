class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to root_url
        else
            render 'new'
        end
    end

    def account
    end

    def profile
        @user = current_user
    end

    def update_profile
        @user = current_user
        if @user.update(user_params)
            flash[:notice] = "ユーザー情報を更新しました。"
            redirect_to @user
        else
            render 'profile'
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
        end

end
