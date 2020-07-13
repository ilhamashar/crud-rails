class SessionsController < ApplicationController
  def new

  end

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user
      if user.authenticate(password)
        session[:user_id] = user.id
        redirect_to books_path, notice: 'kamu telah login'
      else
        redirect_to new_session_path, notice: 'username atau password salah'
      end
    else
      redirect_to new_session_path, notice: 'username atau password salah'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'kamu telah logout'
  end

end
