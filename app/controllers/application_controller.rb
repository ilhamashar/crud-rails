class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

  def user_signed_in?
    if current_user
      true
    else
      redirect_to new_session_path, notice: 'silahkan login terlebih dahulu'
      return false
    end
  end

end
