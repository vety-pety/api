class Animal < ApplicationRecord
  belongs_to :user, required: true
end
