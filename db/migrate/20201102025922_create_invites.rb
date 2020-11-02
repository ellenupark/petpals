class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.integer :pet_id
      t.integer :event_id
      t.string :message

      t.timestamps
    end
  end
end
