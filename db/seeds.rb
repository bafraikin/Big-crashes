# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = File.open("URL", "r")

url.each_with_index do | hebdo, index |
  unless index == 0
    Hebdo.create(url: hebdo.split("!")[1].chomp, name: hebdo.split("!")[0])
  end
end
