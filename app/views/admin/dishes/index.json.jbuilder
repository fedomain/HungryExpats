json.array!(@dishes) do |dish|
  json.extract! dish, :id, :name, :description, :price, :picture, :spiciness, :is_available, :has_options, :is_active
  json.url dish_url(dish, format: :json)
end
