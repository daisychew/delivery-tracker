class RenameDeliveryColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :deliveries, :description, :tracking_number
    rename_column :deliveries, :details, :notes
    rename_column :deliveries, :supposed_to_arrive_on, :order_number
  end
end
