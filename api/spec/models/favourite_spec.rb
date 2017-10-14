require 'rails_helper'

RSpec.describe Favourite, type: :model do
  context 'when validating associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:book) }
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:book) }
  end
end
