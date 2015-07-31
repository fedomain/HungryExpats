json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :age, :phone, :email, :username, :phone_verification_code, :has_agreed, :is_active
  json.url customer_url(customer, format: :json)
end
