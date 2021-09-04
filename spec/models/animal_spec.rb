require 'rails_helper'

RSpec.describe Animal, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
