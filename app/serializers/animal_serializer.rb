class AnimalSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :species

  has_one :user, serializer: UserSerializer, include: true
end
