# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

admin = User.create!(:name => 'Alex Stone', :email => 'alexstone.cal@gmail.com')
admin.role = "admin"
admin.sessions.build(:provider => 'google', :uname => 'Alex Stone', :uemail => 'alexstone.cal@gmail.com', :uid => 'https://www.google.com/accounts/o8/id?id=AItOawl_NJGww-qQ6fqiBX1BbyrD_ihd9dG2A80')
admin.save!
