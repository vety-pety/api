class AnimalForm
  form_for :animal, params: [
    :age, :name, :species
  ]

  belongs_to :user,  form:  UserForm
end
