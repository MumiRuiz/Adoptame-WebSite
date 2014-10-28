class Pet < ActiveRecord::Base

  has_attached_file :photo, :styles => { :large => "708x671#", :medium => "320x290#", :mediumsmall => "259x159#",  :small => "288x268#", :thumb => "160x160#" },
                  :storage => :s3,
                  :bucket => 'adoptame-pets-photos'

  validates_attachment_content_type :photo, :presence => true, :size => { :in => 0..10.megabytes }, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :institution
  has_one :institution
  belongs_to :institution

accepts_nested_attributes_for :institution

	acts_as_taggable

	def self.search(search)
  	if search
   			 find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
 		 else
   			 find(:all)
  	end
	end

end
