class AddDeliveryDateToDeliveries < ActiveRecord::Migration[7.0]
  def change
    add_column :deliveries, :delivery_date, :date
  end
end
