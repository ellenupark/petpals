class DropAgeColumnFromPets < ActiveRecord::Migration[6.0]
  def change
    remove_column :pets, :age
  end
end
