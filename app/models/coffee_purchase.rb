class CoffeePurchase < ApplicationRecord
    # This part calculates the weekly spending
    def self.weekly_spending
        start_of_week = Time.now.beginning_of_week # Grabs the start of the week
        end_of_week = Time.now.end_of_week # grabs the end of the week
        where(purchased_at: start_of_week..end_of_week).sum(:price) # gets the sum for every entry in between the start and end of the week
    end

    # Calculating monthly spending
    def self.monthly_spending
        start_of_month = Time.now.beginning_of_month # grabs the beginning of the current month
        end_of_month = Time.now # Grabs the day of today which is the latest the price can be calculated until
        where(purchased_at: start_of_month..end_of_month).sum(:price) # gets the sum for every entry in between the start and end of the month
    end
end
