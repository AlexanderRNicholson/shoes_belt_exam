class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.integer :amount
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :shoes, :users
  end
end
