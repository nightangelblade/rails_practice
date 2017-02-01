Category.delete_all
Article.delete_all
User.delete_all

User.create!(username: "bob", password: "password")

5.times {Category.create!(title: Faker::Lorem.word)}

Category.all.each do |category|
  5.times do
    category.articles.create!(title: Faker::Lorem.word, body: Faker::Lorem.paragraph)
  end
end
