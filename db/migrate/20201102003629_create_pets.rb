class CreatePets < ActiveRecord::Migration[6.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.integer :weight
      t.string :gender

      t.timestamps
    end
  end
end
