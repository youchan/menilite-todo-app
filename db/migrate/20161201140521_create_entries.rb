class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :guid, index: true, unique: true
      t.string :description
      t.boolean :done
    end
  end
end
