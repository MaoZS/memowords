# encoding : utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :session_check
  before_filter :session_expire
  before_filter :admin
  #before_filter :session_update
    
  private  
  def current_user  
    current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end 
  
  def session_check
    unless session[:user_id]
      redirect_to log_in_url, notice: "ログインしてください"
    end
  end
  
  def session_expire
    expire_time = session[:expires_at]
    now = Time.now.to_i
    if expire_time.to_i < now
      reset_session
      redirect_to log_in_url, notice: "セッション保持の時間切れ　ログインしなおしてください"
    end
  end
  
  def session_update
    session[:expires_at] = Time.now + ( 4 * ( 60 * 60 * 24 ))
  end
  
  def admin
    unless session[:user_id] == 2
      redirect_to root_url, notice:"アクセスする権限がありません"
    end
  end
end
