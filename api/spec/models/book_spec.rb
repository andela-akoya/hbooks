require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'when validating associations' do
    it { is_expected.to belong_to(:added_by) }
    it {
      is_expected.to have_many(:favourites)
        .dependent(:destroy)
        .validate(true)
    }
    it { is_expected.to have_many(:favourite_users) }
    it {
      is_expected.to have_many(:reviews)
        .dependent(:destroy)
        .validate(true)
    }
    it { is_expected.to have_many(:reviewers) }
  end

  context 'when validating presence' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:image) }
  end
end
