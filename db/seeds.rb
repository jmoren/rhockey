# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
categories = Category.create([{:name => "Hombres A"},{:name => "Hombres B"},
                               {:name => "Mujeres"},{:name => "Bantam"},{:name => "midget"},
                               {:name => "peewee-14"},{:name => "peewee-12"}])