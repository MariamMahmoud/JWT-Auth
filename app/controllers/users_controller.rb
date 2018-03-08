class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create, :login]
    def create
        @user = User.create(user_params)
        respond_with @user
    end

    def login
        authenticate params[:phone_number], params[:password]
    end

    private
        def authenticate(phone_number, password)
            command = AuthenticateUser.call(phone_number, password)
        
            if command.success?
            render json: {
                auth_token: command.result,
                message: 'Login Successful'
            }
            else
            render json: { error: command.errors }, status: :unauthorized
            end
        end
        def user_params
            params.require(:user).permit(:first_name, :last_name, :phone_number,:country_code, :gender, :birth_date, :avatar, :email, :password)
        end
        
end
