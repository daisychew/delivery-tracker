class ChangeOrderType < ActiveRecord::Migration[7.0]
  def change
    change_column :deliveries, :order_number, :string
  end
end
