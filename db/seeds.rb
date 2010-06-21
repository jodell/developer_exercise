
Placement.create :section => 'left', :ad_type => 'moderate', 
  :quantity => 1, :rate => 5, :start_date => DateTime.now, :end_date => DateTime.now + 60,
  :buy_id => 1

Placement.create :section => 'right', :ad_type => 'sale', 
  :quantity => 1, :rate => 30, :start_date => DateTime.now, :end_date => DateTime.now + 30,
  :buy_id => 1

Placement.create :section => 'top', :ad_type => 'baller', 
  :quantity => 1, :rate => 10, :start_date => DateTime.now, :end_date => DateTime.now + 90,
  :buy_id => 2

Placement.create :section => 'bottom', :ad_type => 'baller', 
  :quantity => 1, :rate => 10, :start_date => DateTime.now, :end_date => DateTime.now + 90,
  :buy_id => 2

Placement.create :section => 'top', :ad_type => 'cheap', 
  :quantity => 1, :rate => 1, :start_date => DateTime.now, :end_date => DateTime.now + 60,
  :buy_id => 3

Placement.create :section => 'left', :ad_type => 'baller', 
  :quantity => 1, :rate => 10, :start_date => DateTime.now, :end_date => DateTime.now + 90,
  :buy_id => 3

Placement.create :section => 'left', :ad_type => 'baller', 
  :quantity => 1, :rate => 10, :start_date => DateTime.now, :end_date => DateTime.now + 90,
  :buy_id => 4

Placement.create :section => 'left', :ad_type => 'baller', 
  :quantity => 1, :rate => 10, :start_date => DateTime.now, :end_date => DateTime.now + 90,
  :buy_id => 5

Placement.create :section => 'top', :ad_type => 'cheap', 
  :quantity => 1, :rate => 1, :start_date => DateTime.now, :end_date => DateTime.now + 60,
  :buy_id => 6



Site.create :url => 'http://facebook.com', :name => 'facebook', :contact => 'Mark Zuckerberg'
Site.create :url => 'http://cnn.com', :name => 'cnn', :contact => 'Ted Turner'
 
# Nike buys a set of placements at facebook
b = Buy.new(:plan_id => 1, :site_id => 1)
b.placements = Placement.find_all_by_buy_id(1)
b.save

# Zappos buys a set of placements at facebook
b = Buy.create :plan_id => 2, :site_id => 1
b.placements = Placement.find_all_by_buy_id(2)
b.save

# Adidas buys a set of placements at cnn
b = Buy.create :plan_id => 3, :site_id => 2
b.placements = Placement.find_all_by_buy_id(3)
b.save

b = Buy.create :plan_id => 4, :site_id => 3
b.placements = Placement.find_all_by_buy_id(4)
b.save

b = Buy.create :plan_id => 1, :site_id => 1
b.placements = Placement.find_all_by_buy_id(5)
b.save
 
b = Buy.create :plan_id => 1, :site_id => 2
b.placements = Placement.find_all_by_buy_id(6)
b.save
  
p = Plan.create :advertiser_name => 'Nike'
p.buys = Buy.find_all_by_plan_id(1)
p.save 

p = Plan.create :advertiser_name => 'Zappos'
p.buys = Buy.find_all_by_plan_id(2)
p.save

p = Plan.create :advertiser_name => 'Adidas'
p.buys = Buy.find_all_by_plan_id(3)
p.save

p = Plan.create :advertiser_name => 'Reebok'
p.buys = Buy.find_all_by_plan_id(4)
p.save
 
