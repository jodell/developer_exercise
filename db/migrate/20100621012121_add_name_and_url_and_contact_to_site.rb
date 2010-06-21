class AddNameAndUrlAndContactToSite < ActiveRecord::Migration
  def self.up
    add_column :sites, :name,    :string
    add_column :sites, :url,     :string
    add_column :sites, :contact, :string
  end
 
  def self.down
    remove_column :sites, :name
    remove_column :sites, :url
    remove_column :sites, :contact
  end
end
