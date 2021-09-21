# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

user = User.create([
    {username: "Timmy", password:"fir,sts"},
    {username: "Manny", password:"fir,sts"}
])

User.all.map{|user|

    Profile.create([
        {name: "", age: 0, current_weight: 0, target_weight: 0, calories: 0, protein: 0, fat: 0, carbohydrates: 0, allergies: "", diet: "", user_id: user.id}
    ])

    # Meal.create([
    #     {title: Faker::Food.dish, readyInMinutes: rand(15..60), servings: rand(1..10), sourceUrl: 'test.com', favorite: false, user_id: user.id },
    #     {title: Faker::Food.dish, readyInMinutes: rand(15..60), servings: rand(1..10), sourceUrl: 'test.com', favorite: false, user_id: user.id },
    #     {title: Faker::Food.dish, readyInMinutes: rand(15..60), servings: rand(1..10), sourceUrl: 'test.com', favorite: false, user_id: user.id }
    # ])

}

# profile = Profile.create([
#     {name: 'Tim Burn', age: 32, current_weight: 143, target_weight: 160, user_id: user_ids[profile_id] },
#     {name: 'Carry Bill', age: 25, current_weight: 140, target_weight: 125, user_id: user_ids[profile_id] }
# ])

# profile_ids = Profile.all.map{|profile| profile.id}

# meal = Meal.create([
#     {title: 'Oatmeal', readyInMinutes: 35, servings: 4, sourceUrl: 'oatmeal.com', favorite: false, user_id: rand(user_ids.first...user_ids.last) },
#     {title: 'Omlete', readyInMinutes: 15, servings: 2, sourceUrl: 'omlete.com', favorite: false, user_id: rand(user_ids.first...user_ids.last) },
#     {title: 'Grits', readyInMinutes: 20, servings: 3, sourceUrl: 'grits.com', favorite: false, user_id: rand(user_ids.first...user_ids.last) }
# ])