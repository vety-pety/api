class Animals < ApplicationRecord
  belongs_to :user, required: true
end
