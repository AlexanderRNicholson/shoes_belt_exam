class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :user, index: true
      t.references :shoe, index: true
      t.integer :purchased_by

      t.timestamps null: false
    end
    add_foreign_key :transactions, :users
    add_foreign_key :transactions, :shoes
  end
end
