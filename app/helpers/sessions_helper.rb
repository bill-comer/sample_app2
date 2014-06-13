module SessionsHelper
  
  # adds the users id to the session
  def sign_in(user)
    session[:remember_token] = user.id
    self.current_user = user
  end
  
  # remove the user from the session
  def sign_out
    self.current_user = nil
    session.delete(:remember_token)
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    remember_token = session[:remember_token]
    @current_user ||= User.find_by(id: remember_token)
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
