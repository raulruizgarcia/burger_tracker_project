require_relative '../models/eatery.rb'
require_relative '../models/burger.rb'
require_relative '../models/deal.rb'
require_relative '../models/burger_deal.rb'
require 'pry'

# Cascade delete all the elements in the DB
Eatery.delete_all
Burger.delete_all
Deal.delete_all
BurgerDeal.delete_all

eatery1 = Eatery.new({"name" => "Bob's Burgers"})
eatery1.save
eatery2 = Eatery.new({"name" => "Mark Donalds"})
eatery2.save

burger1 = Burger.new({"name" => "As gouda as it gets", "eatery_id" => eatery1.id})
burger2 = Burger.new({"name" => "Sympathy for the Deviled Egg Burger", "eatery_id" => eatery2.id})
burger3 = Burger.new({"name" => "Sweet Home Avocado Burger", "eatery_id" => eatery1.id})

burger1.save
burger2.save
burger3.save

deal1 = Deal.new({"name" => "2x1 Tuesday", "eatery_id" => eatery1.id, "day_of_the_week" => "Tuesday"})
deal2 = Deal.new({"name" => "Bring your cat - get 1/3 off your burger", "eatery_id" => eatery2.id, "day_of_the_week" => "Thursday"})
deal3 = Deal.new({"name" => "2x1 Tuesday. Now on Friday!", "eatery_id" => eatery1.id, "day_of_the_week" => "Friday"})

deal1.save
deal2.save
deal3.save

burger_deal1 = BurgerDeal.new({"burger_id" => burger1.id, "deal_id" => deal1.id})
burger_deal2 = BurgerDeal.new({"burger_id" => burger2.id, "deal_id" => deal2.id})
burger_deal3 = BurgerDeal.new({"burger_id" => burger1.id, "deal_id" => deal3.id})
burger_deal4 = BurgerDeal.new({"burger_id" => burger3.id, "deal_id" => deal3.id})


burger_deal1.save
burger_deal2.save
burger_deal3.save
burger_deal4.save


binding.pry
nil
