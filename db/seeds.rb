# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!({
               name:          'Caner Tasan',
               email:         'caner.tasan@hotmail.com',
               phone:         '05364511885',
               is_subscribed: true
             })

Animal.create!({
                 name:    'Ates',
                 age:     3,
                 species: 'dog',
                 user_id: 1
               })

# Care subscription added
SubscriptionPlan.create!({
                           description: 'Care',
                           price:       89,
                           details:     [
                             { type: 'Dış Parazit', quantity: 3 },
                             { type: 'İç Parazit', quantity: 4 },
                             { type: 'Muayene', quantity: 4 }
                           ]
                         })

# Care Up subscription added
SubscriptionPlan.create!({
                           description: 'Care Up',
                           price:       119,
                           details:     [
                             { type: 'Yıllık Aşılar', quantity: 3 },
                             { type: 'Dış Parazit', quantity: 4 },
                             { type: 'İç Parazit', quantity: 4 },
                             { type: 'Muayene', quantity: 6 },
                             { type: 'Banyo ve Tıraş', quantity: 2 }
                           ]
                         })

# Care All subscription added
SubscriptionPlan.create!({
                           description: 'Care All',
                           price:       159,
                           details:     [
                             { type: 'Yıllık Aşılar', quantity: 4 },
                             { type: 'Dış Parazit', quantity: 4 },
                             { type: 'İç Parazit', quantity: 6 },
                             { type: 'Muayene', quantity: 6 },
                             { type: 'Banyo ve Tıraş', quantity: 4 },
                             { type: 'Tırnak Kesimi', quantity: 2 }
                           ]
                         })
