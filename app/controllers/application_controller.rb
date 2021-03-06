class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  include DeviseHelper

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  private

  def user_not_authorized
    redirect_to not_authorized_path
  end
end
