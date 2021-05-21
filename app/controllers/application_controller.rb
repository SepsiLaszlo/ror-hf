class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    user_id = session['user_id']
    User.find(user_id) if user_id
  end
end
