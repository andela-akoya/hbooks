module ControllerSpecHelper
  # generate tokens from user id
  def token_generator(user_id)
    JsonWebToken.encode(user_id: user_id)
  end

  # generate expired token
  def expired_token_generator(user_id)
    JsonWebToken.encode({ user_id: user_id }, (Time.now.to_i - 10))
  end

  # return invalid header
  def valid_header(user_id = 0)
    {
      'Authorization' => token_generator(user_id),
      'Content-Type' => 'application/json'
    }
  end

  # return invalid header
  def invalid_header
    {
      'Authorization' => token_generator(5),
      'Content-Type' => 'application/json'
    }
  end
end
