class AddBuyerNamesToTransaction < ActiveRecord::Migration
  def change
        add_column :transactions, :buyer_first_name, :string
    add_column :transactions, :buyer_last_name, :string
  end
end
