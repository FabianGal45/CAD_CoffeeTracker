require "test_helper"

class CoffeePurchasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_purchase = coffee_purchases(:one)
  end

  test "should get index" do
    get coffee_purchases_url
    assert_response :success
  end

  test "should get new" do
    get new_coffee_purchase_url
    assert_response :success
  end

  test "should create coffee_purchase" do
    assert_difference("CoffeePurchase.count") do
      post coffee_purchases_url, params: { coffee_purchase: { price: @coffee_purchase.price, purchased_at: @coffee_purchase.purchased_at } }
    end

    assert_redirected_to coffee_purchase_url(CoffeePurchase.last)
  end

  test "should show coffee_purchase" do
    get coffee_purchase_url(@coffee_purchase)
    assert_response :success
  end

  test "should get edit" do
    get edit_coffee_purchase_url(@coffee_purchase)
    assert_response :success
  end

  test "should update coffee_purchase" do
    patch coffee_purchase_url(@coffee_purchase), params: { coffee_purchase: { price: @coffee_purchase.price, purchased_at: @coffee_purchase.purchased_at } }
    assert_redirected_to coffee_purchase_url(@coffee_purchase)
  end

  test "should destroy coffee_purchase" do
    assert_difference("CoffeePurchase.count", -1) do
      delete coffee_purchase_url(@coffee_purchase)
    end

    assert_redirected_to coffee_purchases_url
  end

  test "should update weekly spending" do
    #gets current spending
    initial_weekly_spending = CoffeePurchase.weekly_spending

    #checks if the number of coffee purchases has increased after running expression
    assert_difference("CoffeePurchase.count") do 
      post coffee_purchases_url, params: { coffee_purchase: { price: @coffee_purchase.price, purchased_at: Time.now } } #using time. now to make sure there is a value entered this week
    end
    #Checks if the user is redirecred to the last created coffee purchase
    assert_redirected_to coffee_purchase_url(CoffeePurchase.last)

    #Redirects to Coffee purchases
    get coffee_purchases_url
    assert_response :success

    #Gets new spending
    new_weekly_spending = CoffeePurchase.weekly_spending

    #check initial weekly spending is lower than the new weekly spending
    assert initial_weekly_spending < new_weekly_spending, "Weekly spending #{initial_weekly_spending} did not increase to #{new_weekly_spending}"
  end

  test "should update monthly spending" do
    #gets current spending
    initial_monthly_spending = CoffeePurchase.monthly_spending

    #checks if the number of coffee purchases has increased after running expression
    assert_difference("CoffeePurchase.count") do 
      post coffee_purchases_url, params: { coffee_purchase: { price: @coffee_purchase.price, purchased_at: Time.now } }
      end
    #Checks if the user is redirecred to the last created coffee purchase
    assert_redirected_to coffee_purchase_url(CoffeePurchase.last)

    #Redirects to Coffee purchases
    get coffee_purchases_url
    assert_response :success

    #Gets new spending
    new_monthly_spending = CoffeePurchase.monthly_spending

    #check initial weekly spending is lower than the new weekly spending
    assert initial_monthly_spending < new_monthly_spending, "Monthly spending #{initial_monthly_spending} did not increase to #{new_monthly_spending}"
  end


end