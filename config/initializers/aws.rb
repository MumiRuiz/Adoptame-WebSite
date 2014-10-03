require 'aws'
require 'yaml'
if Rails.env == "production"
	AWS.config({ :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']})
else
	config_path = File.expand_path(File.dirname(__FILE__)+"/../aws.yml")
	AWS.config(YAML.load(File.read(config_path)))
end
