task delete_items: :environment do
 Item.where("created_at <= ?", Time.now - 7.days).destroy_all
end
task testing: :environment do 
  user = User.last.lists.first.title
  puts "This is your list name: #{user}."
end

