namespace :cequel do
  desc "Seed the Cassandra DB"
  task seed: :environment do
    load Rails.root.join('db', 'seeds.rb')
  end

end
