require "application_responder"

class ApplicationController < ActionController::API
    before_action :authenticate_request
    attr_reader :current_user

    self.responder = ApplicationResponder
    respond_to :json

    private
    def authenticate_request
        debugger
      @current_user = AuthorizeApiRequest.call(request.headers).result
      if @current_user && @current_user.phone_number != params[:phone_number]
        render json: {error: 'Incorrect Phone Number'}, status: 400
      else        
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
      end
    end
end
