class Plan < ActiveRecord::Base
  has_many :buys
  validates_presence_of :buys, :advertiser_name
  has_many :sites, :through => :buys

  def self.find_all_on_site(site)
    Buy.find(:all, :conditions => ['site_id = ?', site.id]).collect { |b| b.plan }
  end

  def cost
    buys.inject(0) do |n, b|
      n + b.cost
    end
  end

#  def self.find_all_with_buys_for_site(site)
#    if site
#      if buys = Buy.find_by_site(site)
#        return buys.plans
#      end
#    end
#    nil
#  end

end
