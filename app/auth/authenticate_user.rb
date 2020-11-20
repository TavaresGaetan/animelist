class AuthenticateUser
    def initialize(name, password, rights)
      @name = name
      @password = password
      @rights = rights
    end
  
    # Service entry point
    def call
      JsonWebToken.encode(user_id: user.id) if user
    end
  
    private
  
    attr_reader :name, :password
  
    # verify user credentials
    def user
      user = User.find_by(name: name)
      return user if user && user.authenticate(password)
      # raise Authentication error if credentials are invalid
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
  end