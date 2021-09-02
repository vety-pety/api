# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_830_122_713) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'animals', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'age'
    t.string 'species', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_animals_on_user_id'
  end

  create_table 'subscription_details', id: :serial, force: :cascade do |t|
    t.string 'type', null: false
    t.integer 'quantity', default: 0, null: false
    t.bigint 'subscription_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['subscription_id'], name: 'index_subscription_details_on_subscription_id'
  end

  create_table 'subscriptions', id: :serial, force: :cascade do |t|
    t.bigint 'animal_id', null: false
    t.datetime 'subscribed_until', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['animal_id'], name: 'index_subscriptions_on_animal_id'
  end

  create_table 'users', id: :serial, force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.string 'phone', limit: 20
    t.boolean 'is_subscribed'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'animals', 'users'
  add_foreign_key 'subscription_details', 'subscriptions'
  add_foreign_key 'subscriptions', 'animals'
end
