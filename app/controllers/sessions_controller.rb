class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(mail_param)
    if user && user.authenticate(pw_param[:password])
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  
  def mail_param
    params.require(:session).permit(:email)
  end


  def pw_param
    params.require(:session).permit(:password)
  end
end
