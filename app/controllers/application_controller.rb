class ApplicationController < ActionController::API
      include ActionController::MimeResponds
      include Pundit

  respond_to :json

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
  private
 
    def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
