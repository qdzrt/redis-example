# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Article.create([
    { title: 'redis', content: 'redis test', articles_count: 0 },
    { title: 'candy', content: 'candy test', articles_count: 0 },
    { title: 'candy lab', content: 'candy lab test', articles_count: 0 },
    { title: 'sidekiq', content: 'sidekiq test', articles_count: 0 },
    { title: 'ruby on rails', content: 'ruby on rails test', articles_count: 0 },
    { title: 'ruby', content: 'ruby test', articles_count: 0 },
    { title: 'rails', content: 'rails test', articles_count: 0 },
    { title: 'can you', content: 'can you test', articles_count: 0 },
    { title: 'see you', content: 'see you test', articles_count: 0 }
               ])