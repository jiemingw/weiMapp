json.array!(@wei_users) do |wei_user|
  json.extract! wei_user, :id, :latitude, :longitude, :address, :description, :title
  json.url wei_user_url(wei_user, format: :json)
end
