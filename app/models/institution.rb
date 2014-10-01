class Institution < ActiveRecord::Base
	 has_attached_file :logo, :styles => { :medium => "470x470>", :thumb => "58x58>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

end
