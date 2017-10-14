require './spec/rails_helper'

RSpec.describe User, type: :model do
  context 'when validating associations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
    it { is_expected.to have_many(:favourites).dependent(:destroy) }
    it { is_expected.to have_many(:favourite_books) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_many(:books_reviewed) }
  end

  context 'when validating presence' do
    it { is_expected.to  validate_presence_of(:username) }
    it { is_expected.to  validate_presence_of(:firstname) }
    it { is_expected.to  validate_presence_of(:lastname) }
    it { is_expected.to  validate_presence_of(:email) }
    it {
      is_expected.to validate_inclusion_of(:is_admin)
        .in_array([true, false])
    }
  end
end
