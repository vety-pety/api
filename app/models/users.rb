class Users < ApplicationRecord
  has_many :animals, dependent: :destroy
end
