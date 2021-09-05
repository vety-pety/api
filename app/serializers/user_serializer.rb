class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :encrypted_password, :phone

  # has_many :animals, serializer: App::AnimalSerializer, include: true
end
