class UserForm
  form_for :user, params: [
    :name, :password, :email, :phone
  ]

  has_many :animals, form:  AnimalForm,
                     types: ['animals']
end
