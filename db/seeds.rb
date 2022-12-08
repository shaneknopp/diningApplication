# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
MenuItem.destroy_all

#Removed meal_of_day from seeds
chicken = MenuItem.create!(name: "Chicken Alfredo", description: "Fettucine pasta in a creamy sauce with grilled chicken",  ingredients: "Chicken, Alfredo Sauce, Fettucine Pasta", calories: 400, allergens: "Dairy, Gluten", diet: "")
pizza = MenuItem.create!(name: "Pizza", description: "Plain cheese pizza",  ingredients: "Flour, Eggs, Oil, Mozzerella Cheese, Tomatoes", calories: 250, allergens: "Dairy, Gluten", diet: "Vegetarian")
pbj = MenuItem.create!(name: "PB&J Sandwich", description: "Peanut Butter and Jelly Sandwich",  ingredients: "Whole Wheat Bread, Peanut Butter, Grape Jelly", calories: 150, allergens: "Gluten, Nuts", diet: "Vegetarian, Vegan")
stirfry = MenuItem.create!(name: "Vegetable Stir Fry", description: "Assorted vegetebles fried with rice",  ingredients: "Carrots, Peas, Cabbage, Zucchini, Garlic, Onions, Rice", calories: 300, allergens: "Soy", diet: "Vegetarian, Vegan")
pancakes = MenuItem.create!(name: "GF Pancakes", description: "Gluten free pancakes with butter and maple syrup",  ingredients: "Rice Flour, Buttermilk, Oil, Maple Syrup, Butter", calories: 450, allergens: "Dairy", diet: "Vegetarian")
garlicbread = MenuItem.create!(name: "Garlic Bread", description: "A side of garlic bread",  ingredients: "Bread, Butter, Garlic", calories: 75, allergens: "Dairy, Gluten", diet: "Vegetarian")
yogurt = MenuItem.create!(name: "Yogurt", description: "Vanilla greek yogurt",  ingredients: "Milk, Vanilla Extract", calories: 100, allergens: "Dairy", diet: "Vegatarian")
steak = MenuItem.create!(name: "Steak", description: "Grilled Wagyu steak",  ingredients: "Wagyu Beef, Salt, Black Pepper", calories: 350, allergens: "", diet: "")


# debugger
Dininghall.destroy_all

frank = Dininghall.create!(name: "Frank Dining Hall", hours: "7:30am - 12:00am", breakfast_hours: "7:00am - 10:00am", menu: "Current Menu")
coop = Dininghall.create!(name: "Coop", hours: "7:30am - 12:00am", breakfast_hours: "7:00am - 10:00am", lunch_hours: "11:00am - 5:00pm", menu: "Current Menu")
donny = Dininghall.create!(name: "Donnovan's Pub", hours: "7:30am - 12:00am", breakfast_hours: "7:00am - 10:00am", menu: "Current Menu")
chobe = Dininghall.create!(name: "Chobani", hours: "7:30am - 12:00am", breakfast_hours: "7:00am - 10:00am", time: Time.new(2008,6,21, 13,30,0, "+09:00"), menu: "Current Menu")

User.create!(:email => 'admin@colgate.edu', :admin => true, :password => "Colgate13")


#Seed menu then associate items with menus 
#associate menus to dining halls

Menu.destroy_all
#Frank
frank.menus.create!(meal_of_day: "Breakfast", begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30, 0, "+09:00"))
frank.menus.create!(meal_of_day: "Lunch", begin_time: Time.new(2022, 12,3, 17, 00, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 19, 30,0, "+09:00"))
frank.menus.create!(meal_of_day: "Dinner", begin_time: Time.new(2022, 12,3, 20, 00, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 23, 59,0, "+09:00"))
frank.menus.create!(meal_of_day: "All Day", begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 23, 59,0, "+09:00"))
#Coop
coop.menus.create!(meal_of_day: "Breakfast", begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 16, 30,0, "+09:00"))
coop.menus.create!(meal_of_day: "Lunch", begin_time: Time.new(2022, 12,3, 17, 00, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 19, 30,0, "+09:00"))
coop.menus.create!(meal_of_day: "Dinner", begin_time: Time.new(2022, 12,3, 20, 00, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 23, 59,0, "+09:00"))
coop.menus.create!(meal_of_day: "All Day", begin_time: Time.new(2022, 12,3, 13, 30, 0, "+09:00"), end_time: Time.new(2022, 12, 3, 23, 59,0,"+09:00"))

#Associations 
frank.menus.find_by(meal_of_day: "Breakfast").menu_items = [pancakes, pbj]
frank.menus.find_by(meal_of_day: "Lunch").menu_items = [pbj, chicken, pizza]
frank.menus.find_by(meal_of_day: "Dinner").menu_items = [pbj, stirfry, chicken]
frank.menus.find_by(meal_of_day: "All Day").menu_items = [pbj]

coop.menus.find_by(meal_of_day: "Breakfast").menu_items = [yogurt]
coop.menus.find_by(meal_of_day: "Lunch").menu_items = [pizza, yogurt]
coop.menus.find_by(meal_of_day: "Dinner").menu_items = [garlicbread, steak, yogurt]
coop.menus.find_by(meal_of_day: "All Day").menu_items = [yogurt]



