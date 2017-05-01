class AddNameAndAmountToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :product, :string
    add_column :transactions, :amount, :integer
  end
end
