class User < ApplicationRecord
  has_many :animals, dependent: :destroy

  validates :name, length: { maximum: 40,
    too_long: "%{count} characters is the maximum allowed" }
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: {is: 11}, allow_blank: true
end
