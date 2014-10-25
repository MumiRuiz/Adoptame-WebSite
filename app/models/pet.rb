class Pet < ActiveRecord::Base


	#attr_accessible :content, :name, :tag_list
	#acts_as_taggable

  has_attached_file :photo, :styles => { :large => "708x671#", :medium => "320x290#", :mediumsmall => "259x159#",  :small => "288x268#", :thumb => "160x160#" },
                  :storage => :s3,
                  :bucket => 'adoptame-pets-photos'

  validates_attachment_content_type :photo, :presence => true, :size => { :in => 0..10.megabytes }, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  validates_presence_of :user
  has_one :institution
  belongs_to :institution

accepts_nested_attributes_for :institution
 #  attr_accessible :tag_list 

	acts_as_taggable

	def self.search(search)
  	if search
   			 find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
 		 else
   			 find(:all)
  	end
	end

end
