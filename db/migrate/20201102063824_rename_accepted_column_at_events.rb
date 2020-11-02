class RenameAcceptedColumnAtEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :accepted?, :accepted
  end
end
