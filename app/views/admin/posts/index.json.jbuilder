json.array!(@admin_posts) do |admin_post|
  json.extract! admin_post, :id, :content, :nombre, :month, :day
  json.url admin_post_url(admin_post, format: :json)
end
