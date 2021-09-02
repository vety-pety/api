class User < ApplicationRecord
  has_many :animals, dependent: :destroy
end
