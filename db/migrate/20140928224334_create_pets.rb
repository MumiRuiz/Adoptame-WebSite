class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.string :kind
      t.string :gender
      t.string :size
      t.string :story
      t.string :city
      t.string :country
      t.string :region
      t.references :user, index: true
      t.references :institution, index: true

      t.timestamps
    end
  end
end
