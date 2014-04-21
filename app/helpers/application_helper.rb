module ApplicationHelper
  def auth_token
    return <<-HTML.html_safe
    <input type="hidden"
            name="authenticity_token"
            value="<%= form_authenticity_token %>">
    HTML
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def log_in(user)
    session[:session_token] = user.reset_session_token!
    user.save!
  end

  def logged_in?
    !!current_user
  end

  def logout_current_user
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
