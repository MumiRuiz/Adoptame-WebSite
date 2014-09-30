class AddRegionToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :region, :string
  end
end
