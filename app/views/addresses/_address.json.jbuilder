json.extract! address, :id, :building_number, :street, :postcode, :city, :country, :created_at, :updated_at
json.url address_url(address, format: :json)
