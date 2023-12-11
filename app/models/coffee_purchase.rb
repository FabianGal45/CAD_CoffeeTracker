class CoffeePurchase < ApplicationRecord
    # Calculating daily spending
    def self.daily_spending
        group('DATE(purchased_at)').sum(:price)
    end

    # Calculates the weekly spending
    def self.weekly_spending
        start_of_week = Time.now.beginning_of_week
        end_of_week = Time.now.end_of_week
        where(purchased_at: start_of_week..end_of_week).sum(:price)
    end

    # Calculating monthly spending
    def self.monthly_spending
        start_of_month = Time.now.beginning_of_month
        end_of_month = Time.now
        where(purchased_at: start_of_month..end_of_month).sum(:price)
    end
end
