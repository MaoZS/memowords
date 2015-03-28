# encoding : utf-8
class SessionsController < ApplicationController
  skip_before_filter :session_check ,:session_expire,:admin
  def new

  end
  
  def create
    user = User.authenticate(params[:log_in_name],params[:password])
    if user
      session[:user_id] = user.id
      session[:expires_at] = Time.now.to_i + ( 4 * ( 60 * 60 * 24))
      redirect_to root_url, :notice => "ログイン成功！"
    else
      flash.now.alert = "メールアドレスまたはパスワードが間違っています。"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "ログアウトしました。"
  end
  
end
