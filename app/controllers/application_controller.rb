class ApplicationController < ActionController::API
  include Response
   include ExceptionHandler
   rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

   def authenticate_request!
     return invalid_authentication if !payload || !AuthenticationTokenService.valid_payload(payload.first)
     current_user!
     invalid_authentication unless @current_user
   end

  #  def current_user!
  #    @current_user = User.find_by(id: payload[0]['user_id'])
  #  end
    def current_user!
      user_id = payload[0]['user']['id']
      Rails.logger.info("User ID from Token: #{user_id}")
      @current_user = User.find_by(id: user_id)
    end
  
  

   private

   def payload
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
  
    begin
      decoded_token = AuthenticationTokenService.decode(token)
      Rails.logger.info("Decoded Token: #{decoded_token}")
      decoded_token
    rescue StandardError => e
      Rails.logger.error("Token Decoding Error: #{e.message}")
      nil
    end
   end
  

   def invalid_authentication
     render json: { error: 'You will need to login first' }, status: :unauthorized
   end
end