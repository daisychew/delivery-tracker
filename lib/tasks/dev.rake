desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all
  Delivery.destroy_all

  usernames = ["alice", "bob", "carol", "dave", "eve"]

  usernames.each do |username|
    user = User.new
    user.email = "#{username}@example.com"
    user.password = "password"
    user.save

    chars = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map(&:to_a).flatten
    random_string = ''

    10.times do
      delivery = Delivery.new
      delivery.user_id = user.id
      delivery.notes = Faker::Commerce.product_name
      delivery.tracking_number = rand(1000000000000)
      delivery.order_number = (0...8).map { chars[rand(chars.length)] }.join
      delivery.arrived = [true, false].sample

      delivery.save
    end
  end
end
