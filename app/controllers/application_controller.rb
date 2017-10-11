class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_paper_trail_whodunnit
  
  def user_for_paper_trail
    user_signed_in? ? current_user.try(:id) : 'Unknown user'
  end
  
  def access_denied(exception)
    redirect_to root, alert: exception.message
  end
  
end
