class Pet < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :user
  belongs_to :institution

  #attr_accessible :tag_list
	acts_as_taggable

  has_attached_file :photo, :styles => { :large => "708x671#", :medium => "320x290#", :small => "288x268#", :thumb => "160x160#" }, :default_url => "/images/missing.png"
=======
  
  has_attached_file :photo, :styles => { :large => "708x671#", :medium => "320x290#", :small => "288x268#", :thumb => "160x160#" },
                  :storage => :s3,
                  :bucket => 'adoptame-pets-photos'
>>>>>>> 58894735bc8dd137f5b8201e49747631bd4db481
  validates_attachment_content_type :photo, :presence => true, :size => { :in => 0..10.megabytes }, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  belongs_to :institution

end
