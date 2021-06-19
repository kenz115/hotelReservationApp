class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:notice] = "ユーザーが登録されました。"
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

    def edit
        @user = current_user
    end

    def update
        @user = current_user
        update_user = User.new(user_params)
        if @user.authenticate(update_user.current_password)
            if @user.update(user_params)
                flash[:notice] = "アカウント情報更新しました。"
                redirect_to root_url
            else
                render 'edit'
            end
        else
            flash.now[:danger] = 'パスワードが正しくありません。'
            render 'edit'
        end
    end

    def update_profile
        @user = current_user
        if @user.update(user_params)
            flash[:notice] = "ユーザー情報を更新しました。"
            redirect_to '/users/profile'
        else
            render 'profile'
        end
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :introduction, :current_password)
        end

end
