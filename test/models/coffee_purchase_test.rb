require "test_helper"

class CoffeePurchaseTest < ActiveSupport::TestCase
  # Unit testing
  setup do
    CoffeePurchase.delete_all # this clears any existing values 
  end
  # test "the truth" do
  #   assert true
  # end

  #Test adding a purchase with price 10 in the current week - should display 10
  test "should add a purchase" do
    CoffeePurchase.create(price: 10, purchased_at: Time.now) # Week 1, Monday
    assert_equal(10, CoffeePurchase.weekly_spending)
  end

  #Test adding a purchase of 10 for the week before and a purchase of 15 for the current week - should display 15
  test "should display the current week price" do
    CoffeePurchase.create(price: 10, purchased_at: Time.now.prev_week.beginning_of_week) # A week before
    CoffeePurchase.create(price: 15, purchased_at: Time.now) # This week
    assert_equal(15, CoffeePurchase.weekly_spending)
  end

  #Test adding a purchase of 10 for the week before and a purchase of 15 for the current week - should display 25 for the current month
  test "should display both prices of the month for both weeks" do
    CoffeePurchase.create(price: 10, purchased_at: Time.now.prev_week.beginning_of_week) # A week before
    CoffeePurchase.create(price: 15, purchased_at: Time.now) # This week
    assert_equal(25, CoffeePurchase.monthly_spending.to_f)
  end
  
end
