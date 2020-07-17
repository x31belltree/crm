# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do |i|
 Company.create(name: "株式会社sample#{format("%03d",0+i)}",phone_number: "03-1234-56#{format("%02d",0+i)}" ,address: "東京都港区1-1-#{1+i}" ,industry: "サービス業" )
end