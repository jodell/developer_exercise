require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  should_have_many :buys


  context 'a site factory' do
    setup do
      @site = Factory.build(:site)
    end

    should 'create a valid object' do
      assert @site.valid?
    end
  end

end
