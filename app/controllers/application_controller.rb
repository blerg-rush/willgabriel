class ApplicationController < ActionController::Base
  ApplicationNotAuthenticated = Class.new(StandardError)

  rescue_from ApplicationNotAuthenticated do
    flash[:notice] = "Unauthorized action. Please log in."
    redirect_to new_session_path
  end

  def authentication_required!
    session[:current_user] || raise(ApplicationNotAuthenticated)
  end
end
