require 'faker'

case Rails.env
when "development"
  # DUMMY USERS
  puts "Seeding USERS table..."
  puts "======================"

  users = [
    ['admin0', true],
    ['admin1', true],
    ['admin2', true],
    ['member', false],
    ['member1', false],
    ['member2', false]
  ]
  # default users
  users.each do |name, is_admin|
    user = User.new
    user.username = name
    user.password = name
    user.password_confirmation = name
    user.email = "#{name}@dummymail.com"
    user.point = Faker::Number.within(range: 100..1000)
    user.is_admin = is_admin
    user.is_banned = false
    user.credit_card = Faker::PhoneNumber.cell_phone_in_e164[1..]
    user.save!
  end
  # more users
  40.times do
    name = Faker::Name.unique.name.gsub! /\s/, '_'
    user = User.new
    user.username = name
    user.password = name
    user.password_confirmation = name
    user.email = "#{name}@dummymail.com"
    user.point = Faker::Number.within(range: 100..1000)
    user.is_admin = false
    user.is_banned = Faker::Boolean.boolean(true_ratio: 0.1)
    user.credit_card = Faker::PhoneNumber.cell_phone_in_e164[1..]
    user.save!
  end
when "production"
  user = User.new
  user.username = ENV["ADMIN_ACCOUNT"]
  user.password = ENV["ADMIN_PASSWORD"]
  user.password_confirmation = ENV["ADMIN_PASSWORD"]
  user.email = ENV["ADMIN_EMAIL"]
  user.point = Faker::Number.within(range: 100..1000)
  user.is_admin = true
  user.is_banned = false
  user.credit_card = ENV["ADMIN_CREDIT_CARD"]
  user.save!
end

# CATEGORIES
puts "Seeding CATEGORIES table..."
puts "======================"

cat_list = [
  '3D',
  'Adoptables',
  'Animation',
  'Anime and Manga',
  'Anthro',
  'Artisan Crafts',
  'Comics',
  'Cosplay',
  'Customization',
  'Digital Art',
  'Drawings and Paintings',
  'Emoji and Emoticon',
  'Fan Art',
  'Fan Fiction',
  'Fantasy',
  'Fractal',
  'Game Art',
  'Horror',
  'Literature',
  'Photo Manipulation',
  'Photography',
  'Pixel Art',
  'Poetry',
  'Resources',
  'Science Fiction',
  'Sculpture',
  'Stock Images',
  'Street Art',
  'Street Photography',
  'Traditional Art',
  'Wallpaper'
]

cat_list.shuffle.each do |name|
  Category.create(name: name)
end
