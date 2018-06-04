class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  private

  def current_user
    email = session[:email]
    group = session[:group]
    if email && group
      @current_user = [email,group]
    else
    end
    puts(current_user.email)
  end
  helper_method :current_user
end
