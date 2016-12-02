class AddColumnUserOnEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :user_guid, :string, index: true
  end
end
