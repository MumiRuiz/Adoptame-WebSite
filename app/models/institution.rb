class Institution < ActiveRecord::Base
has_attached_file :logo, :styles => { :large => "708x671#", :medium => "470x470#", :thumb => "58x58xs#" },
                  :storage => :s3,
                  :bucket => 'adoptame-pets-photos'

  validates_attachment_content_type :logo, :presence => true, :size => { :in => 0..10.megabytes }, :content_type => /\Aimage\/.*\Z/
	acts_as_taggable

has_many :pets
accepts_nested_attributes_for :pets
	end
