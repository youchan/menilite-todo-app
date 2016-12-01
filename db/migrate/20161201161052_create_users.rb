class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :guid, index: true, unique: true
      t.string :name
      t.string :password
    end
  end
end