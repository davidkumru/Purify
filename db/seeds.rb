# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.delete_all

Post.create( title: "My first post.", content: "Pizza is yummy!")
Post.create( title: "My second post.", content: "Pizza is yummy!")
Post.create( title: "My third post.", content: "Pizza is yummy!")
