class Pet < ActiveRecord::Base
  belongs_to :user
  belongs_to :institution

  #attr_accessible :tag_list
	acts_as_taggable

  has_attached_file :photo, :styles => { :large => "708x671#", :medium => "320x290#", :small => "288x268#", :thumb => "160x160#" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :photo, :presence => true, :size => { :in => 0..10.megabytes }, :content_type => /\Aimage\/.*\Z/

has_attached_file :photo,:default_url => "adoptame.amazonaws.com",
                  :storage => :s3,
                  :bucket => 'adoptame'

end
