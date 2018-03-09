class StatusesController < ApplicationController

    # POST /statuses
    # params [status] String
    def create
        @status = Status.new(status_params)
        @status.user_id = @current_user.id
        @status.save
        respond_with @status
    end

    private
    def status_params
        params.require(:status).permit(:status)
    end
end    