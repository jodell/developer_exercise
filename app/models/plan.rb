class Plan < ActiveRecord::Base
  has_many :buys
  validates_presence_of :buys, :advertiser_name
  has_many :sites, :through => :buys

  def self.find_all_on_site(site)
    #Buy.find(:all, :conditions => ['site_id = ?', site.id]).collect { |b| b.plan }.uniq
    site && Buy.scoped_by_site_id(site.id).collect { |b| b.plan }.uniq
  end

  def cost
    buys.inject(0) do |n, b|
      n + b.cost
    end
  end

end
