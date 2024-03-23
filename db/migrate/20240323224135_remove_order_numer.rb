class RemoveOrderNumer < ActiveRecord::Migration[7.0]
  def change
    remove_column :deliveries, :order_numer
  end
end
