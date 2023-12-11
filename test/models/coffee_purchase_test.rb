require "test_helper"

class CoffeePurchaseTest < ActiveSupport::TestCase
  # Unit testing
  setup do
    CoffeePurchase.delete_all # this clears any existing values 
  end
  # test "the truth" do
  #   assert true
  # end

  #Test adding price 10 in week 1 of month 1 - should display 10
  test "should add a purchase" do
    CoffeePurchase.create(price: 10, purchased_at: Time.now) # Week 1, Monday
    assert_equal(10, CoffeePurchase.weekly_spending)
  end

  #Test adding price 15 in week 2 of month 1 - should display 15
  test "should display the current week price" do
    CoffeePurchase.create(price: 10, purchased_at: Time.now.prev_week.beginning_of_week) # A week before
    CoffeePurchase.create(price: 15, purchased_at: Time.now) # This week
    assert_equal(15, CoffeePurchase.weekly_spending)
  end
  #Test adding price 10 in week 1, adding price 15 in week 2 and display monthly value of 25
  test "should display both prices of the month for both weeks" do
    
    CoffeePurchase.create(price: 10, purchased_at: Time.now.prev_week.beginning_of_week) # A week before
    CoffeePurchase.create(price: 15, purchased_at: Time.now) # This week
    assert_equal(25, CoffeePurchase.monthly_spending.to_f)
  end
  
end
