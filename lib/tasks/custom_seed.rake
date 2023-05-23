# allows for seed only specific part
namespace :db do
  namespace :seed do
    Dir[Rails.root.join('db', 'seeds', '*.rb')].each do |filename|
      # to adhear 000_*.rb format
      base_name = File.basename(filename, '.rb')
      task_name = base_name[4..-1]
      desc "Seed " + task_name + ", based on the file in `db/seeds/#{base_name}.rb`"
      task task_name.to_sym => :environment do
        load(filename) if File.exist?(filename)
      end
    end
  end
end