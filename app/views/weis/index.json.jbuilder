json.array!(@weis) do |wei|
  json.extract! wei, :id, :User, :latitude, :longitude, :address, :description, :title
  json.url wei_url(wei, format: :json)
end
