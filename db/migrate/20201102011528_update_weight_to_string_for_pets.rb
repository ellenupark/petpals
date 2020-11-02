class UpdateWeightToStringForPets < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :weight
    add_column :pets, :weight, :string
  end
end
