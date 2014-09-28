class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :password
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
