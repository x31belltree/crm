# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do |i|
 Company.create!(name: "株式会社sample#{format("%03d",0+i)}",phone_number: "03-1234-56#{format("%02d",0+i)}" ,address: "東京都港区1-1-#{1+i}" ,industry: "サービス業" )
end

Company.all.each do |company|
  company.matters.create!([
     {name: '案件タイトル1',detail: '案件詳細のテキスト1',contact_person: '田中'},
     {name: '案件タイトル2',detail: '案件詳細のテキスト2',contact_person: '田中'},
     {name: '案件タイトル3',detail: '案件詳細のテキスト3',contact_person: '田中'},
     ])
end

users= [
{ name: 'べる鈴木', email: 'bell@test.com', password: '123456' },
{ name: 'ぼる田中', email: 'tanaka@test.com', password: '123456' },
{ name: 'ぱる佐藤', email: 'satou@test.com', password: '123456' },
]
users.each do |record|
 User.create!(record) unless User.find_by(email: record[:email])
end