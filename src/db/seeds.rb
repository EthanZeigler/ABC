# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

@user = User.new(:email => 'test@test.test', :password => 'password', :password_confirmation => 'password')
@user.save

# t.text "description"
#     t.string "location"
#     t.datetime "time"
#     t.text "involved"
#     t.boolean "resolved"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false

for i in 0..10000
  # seed fake reports
  params = {
    description: Faker::Lorem.paragraph,
    location: Faker::RickAndMorty.location,
    time: DateTime.now,
    involved: Faker::TheITCrowd.character + ', ' + Faker::HitchhikersGuideToTheGalaxy.character,
    resolved: '0'
  }

  my_report = Report.new(params)
  unless my_report.save
    puts 'Something went wrong'
    puts params
  end

end