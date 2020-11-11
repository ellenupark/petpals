class AddAgeColumnToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :birthdate, :date
  end
end
