# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

5.times do |i|
	User.create({
		email: "user#{i}@mailinator.com",
		uid: "user#{i}@mailinator.com",
		provider: "email",
		password: "1234.com",
		password_confirmation: "1234.com"
	})
end

Category.delete_all
categories = [
	"Bridal",
	"Computers",
	"Cosmetics & Beauty Supply",
	"Department Stores",
	"Discount Store",
	"Drugstores",
	"Electronics Repair",
	"Eyewear & Opticians",
	"Fashion"
]

categories.each do |category|
	Category.create({
		name: category
	})
end

user_ids = User.all.map(&:id)
category_ids = Category.all.map(&:id)
Business.delete_all
20.times do 
	Business.create({
		name: Forgery(:name).company_name,
		user_id: user_ids.sample,
		category_id: category_ids.sample
	})
end
