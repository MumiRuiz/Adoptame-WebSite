json.array!(@admin_pets) do |admin_pet|
  json.extract! admin_pet, :id, :name, :age, :kind, :gender, :size, :story, :region, :city, :country, :institution
  json.url admin_pet_url(admin_pet, format: :json)
end
