json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :age, :kind, :gender, :size, :story, :city, :country, :region, :user_id, :institution_id
  json.url pet_url(pet, format: :json)
end
