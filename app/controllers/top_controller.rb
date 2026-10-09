class TopController < ApplicationController
  def main
    if session[:login_uid] != nil
      render :main
    else
      render :login
    end
  end

  def login
    uid = params[:uid]
    pass = params[:pass]

    user = User.find_by(uid: uid, pass: pass)

    if user != nil
      session[:login_uid] = uid
      redirect_to top_main_path
    else
      render :error
    end
  end

  def logout
    session.delete(:login_uid)
    redirect_to top_main_path
  end
end