class AddImageColumnToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :image, :string
  end
end
