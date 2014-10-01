class AddAttachmentLogoToInstitutions < ActiveRecord::Migration
  def self.up
    change_table :institutions do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :institutions, :logo
  end
end
