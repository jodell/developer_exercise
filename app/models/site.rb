class Site < ActiveRecord::Base
  has_many :buys
  has_many :plans, :through => :buys
  validates_presence_of :name, :url, :contact
end
