require "application_responder"

class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    self.responder = ApplicationResponder
    respond_to :json

    private
    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      # Wrong/empty phone number will return 400
      if @current_user && @current_user.phone_number != params[:phone_number]
        render json: {error: 'Incorrect Phone Number'}, status: 400
      else        
      # Wrong or empty Auth Token will raise 401
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user
      end
    end
end
