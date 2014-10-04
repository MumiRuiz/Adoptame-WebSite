class AddNitToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :nit, :integer
  end
end
