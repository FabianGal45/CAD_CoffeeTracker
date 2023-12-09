json.extract! coffee_purchase, :id, :price, :purchased_at, :created_at, :updated_at
json.url coffee_purchase_url(coffee_purchase, format: :json)
