# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create([
    {username: "Timmy", password:"fir,sts"},
    {username: "Manny", password:"fir,sts"}
])

user_ids = User.all.map{|user| user.id}

profile = Profile.create([
    {name: 'Tim Burn', age: 32, current_weight: 143, target_weight: 160, meal_id: rand(user_ids.first...user_ids.last) }
    {name: 'Carry Bill', age: 25, current_weight: 140, target_weight: 125, meal_id: rand(user_ids.first...user_ids.last) }
])

profile_ids = Profile.all.map{|profile| profile.id}

meal = Meals.create([
    {title: 'Oatmeal', readyInMinutes: 35, servings: 4, sourceUrl: 'oatmeal.com', favorite: false, profile_id: rand(profile_ids.first...profile_ids.last) }
    {title: 'Omlete', readyInMinutes: 15, servings: 2, sourceUrl: 'omlete.com', favorite: false, profile_id: rand(profile_ids.first...profile_ids.last) }
    {title: 'Grits', readyInMinutes: 20, servings: 3, sourceUrl: 'grits.com', favorite: false, profile_id: rand(profile_ids.first...profile_ids.last) }
])