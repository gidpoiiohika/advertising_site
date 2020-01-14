if Advert.count.zero?
  puts 'Seeding Adverts'
  Advert.create!(name: 'Name1', description: 'Main Advert1', price: 10)
  Advert.create!(name: 'Name2', description: 'Main Advert2', price: 20)
  Advert.create!(name: 'Name3', description: 'Main Advert3', price: 30)
  Advert.create!(name: 'Name4', description: 'Main Advert4', price: 40)
end
