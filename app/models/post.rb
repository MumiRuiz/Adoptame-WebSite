class Post < ActiveRecord::Base

	has_attached_file :avatar, :styles => { :large => "858x400#", :medium => "320x290#", :mediumsmall => "259x159#",  :small => "288x268#", :thumb => "160x160#" },
                  :storage => :s3,
                  :bucket => 'adoptame-pets-photos'
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	belongs_to :user
end
