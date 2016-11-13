class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions



  def current_user

    @user = User.find(session[:user_id]) if user_sign_in?

  end
  helper_method :current_user

  def user_sign_in?
    session[:user_id].present?
  end
  helper_method :user_sign_in?

  # def find_idea_by_idea_id(id)
  #   Idea.find(id).first
  # end
  # helper_method :find_idea_by_idea_id

  def error_message(obj)
    obj.errors.full_messages.join(',')
  end

  def my_authentication
    redirect_to root_path,notice: 'Login first!' unless user_sign_in?
  end

end
