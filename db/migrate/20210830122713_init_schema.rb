class InitSchema < ActiveRecord::Migration[6.1]
  def change
    create_users_table
    create_animals_table
    create_subscriptions_table
    create_subscription_details_table
    create_subscription_plans_table
  end

  private

  def create_users_table
    create_table(:users, id: :serial) do |t|
      t.string(:name, null: false)
      t.string(:email, null: false)
      t.string(:encrypted_password, default: '', null: false)
      t.string(:phone, limit: 20)
      t.boolean(:is_subscribed)

      t.timestamps
    end
    add_index :users, :email, unique: true
  end

  def create_animals_table
    create_table(:animals, id: :serial) do |t|
      t.string(:name, null: false)
      t.integer(:age)
      t.string(:species, null: false)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end
  end

  def create_subscriptions_table
    create_table(:subscriptions, id: :serial) do |t|
      t.string(:description, null: false)
      t.references(:animal, null: false, foreign_key: true)
      t.datetime(:subscribed_until, null: false)

      t.timestamps
    end
  end

  def create_subscription_details_table
    create_table(:subscription_details, id: :serial) do |t|
      t.string(:type, null: false)
      t.integer(:quantity, default: 0, null: false)
      t.references(:subscription, null: false, foreign_key: true)

      t.timestamps
    end
  end

  def create_subscription_plans_table
    create_table(:subscription_plans, id: :serial) do |t|
      t.string(:description, null: false)
      t.decimal(:price, null: false, precision: 6, scale: 2)
      t.json(:details, deafult: {}, null: false)

      t.timestamps
    end
  end
end
