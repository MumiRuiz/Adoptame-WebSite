class AddManagerToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :manager, :string
  end
end
