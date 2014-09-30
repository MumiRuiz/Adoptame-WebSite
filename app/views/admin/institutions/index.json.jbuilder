json.array!(@admin_institutions) do |admin_institution|
  json.extract! admin_institution, :id, :name, :username, :email, :password, :manager, :country, :region, :city, :website
  json.url admin_institution_url(admin_institution, format: :json)
end
