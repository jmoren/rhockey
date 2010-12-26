# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
categories = Category.create([{:name => "Hombres A", :minage => 18, :topage => 99},
                              {:name => "Hombres B", :minage => 18, :topage => 99},
                              {:name => "Mujeres", :minage => 15, :topage => 99},
                              {:name => "Bantam", :minage => 14, :topage => 18},
                              {:name => "midget", :minage => 14, :topage => 18},
                              {:name => "peewee-14", :minage => 12, :topage => 14},
                              {:name => "peewee-12", :minage => 8, :topage => 12}])
admin = User.create(:email => "rhockey@rhockey.com", :password => "rhockey", :password_confirmation => "rhockey" , :admin => true)
actions = Actions.create([{:name => "goal"},{:name => "penalty"},{:name => "assistance"}, {:name => "save"}])
