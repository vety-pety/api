require 'rails_helper'

RSpec.describe SubscriptionDetail, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:subscription) }
  end
end
