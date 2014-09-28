json.array!(@institutions) do |institution|
  json.extract! institution, :id, :name, :username, :email, :password, :location, :website
  json.url institution_url(institution, format: :json)
end
