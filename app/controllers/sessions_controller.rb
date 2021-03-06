class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      flash[:notice] = 'ログイン成功'
      redirect_to root_url
    else
      flash.now[:danger] = 'メールアドレスかパスワードが正しくありません。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
