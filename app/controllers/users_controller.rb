class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: [:create, :login]
    
    # POST /users
    # POST /auth/register (more friendly url)
    
    # params: 
    # mandatory:
    # user[first_name] String
    # user[:last_name] String
    # user[:phone_number] String, unique
    # user[:avatar] String ,:file => allwed types: png, jpeg, jpg
    # user[:country_code] String
    # user[:gender] String
    # user[:password] String
    # optional:
    # user[email] String, unique
    def create
        @user = User.create(user_params)
        respond_with @user
    end

    # POST /auth/login
    # params[phone_number] String
    # params[password] String
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
