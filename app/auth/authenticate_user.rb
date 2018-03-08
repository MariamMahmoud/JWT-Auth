class AuthenticateUser
    prepend SimpleCommand
    attr_accessor :phone_number, :password
  
    #this is where parameters are taken when the command is called
    def initialize(phone_number, password)
      @phone_number = phone_number
      @password = password
    end
    
    #this is where the result gets returned
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    def user
      user = User.find_by(phone_number: phone_number)
      return user if user && user.authenticate(password)
  
      errors.add :user_authentication, 'Invalid credentials'
      nil
    end
  end