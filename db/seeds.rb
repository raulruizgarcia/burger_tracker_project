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

# Eatery seeding
eatery1 = Eatery.new({"name" => "Bob's Burgers", "logo_url" => "/bobs_burgers.jpg"})
eatery1.save
eatery2 = Eatery.new({"name" => "Mark Donalds","logo_url" => "/mark_donalds.png"})
eatery2.save
eatery4 = Eatery.new({"name" => "Krusty Burger", "logo_url" => "/krusty_burger.png"})
eatery4.save
eatery3 = Eatery.new({"name" => "The Krusty Krab", "logo_url" => "/the_krusty_krab.png"})
eatery3.save

# Burger seeding...
burger1 = Burger.new({"name" => "As gouda as it gets", "eatery_id" => eatery1.id})
burger2 = Burger.new({"name" => "Sympathy for the Deviled Egg Burger", "eatery_id" => eatery1.id})
burger3 = Burger.new({"name" => "Sweet Home Avocado Burger", "eatery_id" => eatery1.id})
burger4 = Burger.new({"name" => "Mark Chicken", "eatery_id" => eatery2.id})
burger5 = Burger.new({"name" => "Szechuan burger", "eatery_id" => eatery2.id})
burger6 = Burger.new({"name" => "Mark Chicken DeLuxe", "eatery_id" => eatery2.id})
burger7 = Burger.new({"name" => "Krabby Patty Burger", "eatery_id" => eatery3.id})
burger8 = Burger.new({"name" => "Chicken Sea Burger", "eatery_id" => eatery3.id})
burger9 = Burger.new({"name" => "Hearty Sponge", "eatery_id" => eatery3.id})
burger10 = Burger.new({"name" => "Deep Fried Krusty Burger", "eatery_id" => eatery4.id})
burger11 = Burger.new({"name" => "The Mother Nature Burger", "eatery_id" => eatery4.id})
burger12 = Burger.new({"name" => "Slideshow Bob Foot Long", "eatery_id" => eatery4.id})


burger1.save
burger2.save
burger3.save
burger4.save
burger5.save
burger6.save
burger7.save
burger8.save
burger9.save
burger10.save
burger11.save
burger12.save

# Deal seeding...
deal1 = Deal.new({"name" => "2x1 Tuesday", "eatery_id" => eatery1.id, "day_of_the_week" => "Tuesday"})
deal2 = Deal.new({"name" => "Bring your cat - get 1/3 off your burger", "eatery_id" => eatery1.id, "day_of_the_week" => "Thursday"})
deal3 = Deal.new({"name" => "2x1 Tuesday. Now on Friday!", "eatery_id" => eatery2.id, "day_of_the_week" => "Friday"})
deal4 = Deal.new({"name" => "Clean your own tray - get one for free", "eatery_id" => eatery2.id, "day_of_the_week" => "Wednesday"})
deal5 = Deal.new({"name" => "Krabbing for a burger deal", "eatery_id" => eatery3.id, "day_of_the_week" => "Thursday"})
deal6 = Deal.new({"name" => "Bikini bottom's 2x1 day", "eatery_id" => eatery3.id, "day_of_the_week" => "Saturday"})
deal7 = Deal.new({"name" => "All you can eat!", "eatery_id" => eatery4.id, "day_of_the_week" => "Sunday"})
deal8 = Deal.new({"name" => "Free cursed frogurt", "eatery_id" => eatery4.id, "day_of_the_week" => "Sunday"})

deal1.save
deal2.save
deal3.save
deal4.save
deal5.save
deal6.save
deal7.save
deal8.save

# BurgerDeal seeding
burger_deal1 = BurgerDeal.new({"burger_id" => burger1.id, "deal_id" => deal1.id})
burger_deal2 = BurgerDeal.new({"burger_id" => burger2.id, "deal_id" => deal2.id})
burger_deal3 = BurgerDeal.new({"burger_id" => burger1.id, "deal_id" => deal2.id})
burger_deal4 = BurgerDeal.new({"burger_id" => burger3.id, "deal_id" => deal2.id})

burger_deal5 = BurgerDeal.new({"burger_id" => burger4.id, "deal_id" => deal3.id})
burger_deal6 = BurgerDeal.new({"burger_id" => burger5.id, "deal_id" => deal3.id})
burger_deal7 = BurgerDeal.new({"burger_id" => burger6.id, "deal_id" => deal4.id})
burger_deal8 = BurgerDeal.new({"burger_id" => burger7.id, "deal_id" => deal3.id})

burger_deal9 = BurgerDeal.new({"burger_id" => burger7.id, "deal_id" => deal6.id})
burger_deal10 = BurgerDeal.new({"burger_id" => burger8.id, "deal_id" => deal6.id})
burger_deal11 = BurgerDeal.new({"burger_id" => burger9.id, "deal_id" => deal5.id})
burger_deal12 = BurgerDeal.new({"burger_id" => burger8.id, "deal_id" => deal5.id})

burger_deal13 = BurgerDeal.new({"burger_id" => burger10.id, "deal_id" => deal7.id})
burger_deal14 = BurgerDeal.new({"burger_id" => burger10.id, "deal_id" => deal8.id})
burger_deal15 = BurgerDeal.new({"burger_id" => burger11.id, "deal_id" => deal7.id})
burger_deal16 = BurgerDeal.new({"burger_id" => burger12.id, "deal_id" => deal8.id})


burger_deal1.save
burger_deal2.save
burger_deal3.save
burger_deal4.save
burger_deal5.save
burger_deal6.save
burger_deal7.save
burger_deal8.save
burger_deal9.save
burger_deal10.save
burger_deal11.save
burger_deal12.save
burger_deal13.save
burger_deal14.save
burger_deal15.save
burger_deal16.save


binding.pry
nil
