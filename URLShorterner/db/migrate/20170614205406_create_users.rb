class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.timestamps
    end
  end
  add.index :users, :email, unique: true
end
