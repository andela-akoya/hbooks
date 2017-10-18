# Handles the encoding and decoding of token
class JsonWebToken
  # secret to encode and decode a token
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 24.hours.from_now)
    # set expiry to 24 hours from creation time
    payload[:exp] = exp.to_i
    # sign token with application secret
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    # get payload; first index in decoded Array
    body = JWT.decode(token, HMAC_SECRET)[0]
    # cast all hash keys to string
    HashWithIndifferentAccess.new body
    # raise custom error to be handled by custom handler
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    # raise custom error to be handled by custom handler
    raise ExceptionHandler::InvalidToken, Message.expired_token
  end
end
