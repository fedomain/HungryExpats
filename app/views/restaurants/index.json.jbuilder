json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :address, :picture, :phone_1, :phone_2, :qq, :qr_code, :minimum_order, :delivery_charge, :star_rating, :is_active
  json.url restaurant_url(restaurant, format: :json)
end
