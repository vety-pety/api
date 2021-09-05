class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :encrypted_password, :phone

  has_many :animals, serializer: AnimalSerializer, include: true
end
