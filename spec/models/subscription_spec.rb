require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'associations' do
    it { is_expected.to have_many(:details) }
  end
end
