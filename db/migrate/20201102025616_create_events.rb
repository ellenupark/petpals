class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :host_pet_id
      t.boolean :accepted?

      t.timestamps
    end
  end
end
