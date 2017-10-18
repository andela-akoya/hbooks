require 'rails_helper'

RSpec.describe AuthorizeApiRequest do
  # create test user
  let(:user) { create(:user) }
  # valid request subject
  subject(:request_obj) do
    described_class.new(valid_header(user.id)
      .except('Content-Type'))
  end
  # invalid request subject
  subject(:invalid_request_obj) { described_class.new({}) }

  # Test suite for authorizeApiRequest
  describe '#call' do
    # returns user object when request is valid
    context 'when valid request' do
      it 'returns the object' do
        result = request_obj.call[:user]
        expect(result).to eq(user)
      end
    end

    # returns error message when request is invalid
    context 'when invalid request' do
      context 'when missing token' do
        it 'raises a  MissingToken error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::MissingToken, 'Missing Token')
        end
      end

      context 'when invalid token' do
        subject(:invalid_request_obj) do
          described_class.new(invalid_header.except('Content-Type'))
        end
        it 'raises an InvalidToken error' do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, 'Invalid token')
        end
      end

      context 'when token is expired' do
        let(:header) { { 'Authorization' => expired_token_generator(user.id) } }
        subject(:request_obj) { described_class.new(header) }
        it 'raises an InvalidToken error' do
          expect { request_obj.call }
            .to raise_error(
              ExceptionHandler::InvalidToken,
              'Sorry, your token has expired. Please login to continue'
            )
        end
      end
    end
  end
end
