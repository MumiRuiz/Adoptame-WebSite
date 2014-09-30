class AddCityToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :city, :string
  end
end
