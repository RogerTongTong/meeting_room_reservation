module SessionsHelper

  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
      @current_user ||= User.find_by(session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
