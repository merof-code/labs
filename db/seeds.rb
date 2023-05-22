# seed file split to parts like here https://blog.magmalabs.io/2019/11/25/best-practices-using-rails-seeds.html

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  load file
end