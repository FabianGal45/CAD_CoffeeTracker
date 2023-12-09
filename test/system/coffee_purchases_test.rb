require "application_system_test_case"

class CoffeePurchasesTest < ApplicationSystemTestCase
  setup do
    @coffee_purchase = coffee_purchases(:one)
  end

  test "visiting the index" do
    visit coffee_purchases_url
    assert_selector "h1", text: "Coffee purchases"
  end

  test "should create coffee purchase" do
    visit coffee_purchases_url
    click_on "New coffee purchase"

    fill_in "Price", with: @coffee_purchase.price
    fill_in "Purchased at", with: @coffee_purchase.purchased_at
    click_on "Create Coffee purchase"

    assert_text "Coffee purchase was successfully created"
    click_on "Back"
  end

  test "should update Coffee purchase" do
    visit coffee_purchase_url(@coffee_purchase)
    click_on "Edit this coffee purchase", match: :first

    fill_in "Price", with: @coffee_purchase.price
    fill_in "Purchased at", with: @coffee_purchase.purchased_at
    click_on "Update Coffee purchase"

    assert_text "Coffee purchase was successfully updated"
    click_on "Back"
  end

  test "should destroy Coffee purchase" do
    visit coffee_purchase_url(@coffee_purchase)
    click_on "Destroy this coffee purchase", match: :first

    assert_text "Coffee purchase was successfully destroyed"
  end
end
