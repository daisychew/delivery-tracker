# == Schema Information
#
# Table name: deliveries
#
#  id              :integer          not null, primary key
#  arrived         :boolean
#  delivery_date   :date
#  notes           :string
#  order_number    :string
#  tracking_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
class Delivery < ApplicationRecord
end
