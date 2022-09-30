1.times do
  AdminUser.create(first_name: "Main",
                   last_name: "Admin",
                   nickname: "main_admin",
                   age: 20, #for testing age restriction
                   email: "1_admin@gmail.com",
                   password: "test1234",
                   password_confirmation: "test1234")
end
p "Main admin was created"
1.times do
  User.create(first_name: "Main",
              last_name: "User",
              nickname: "main_user",
              age: 21,
              email: "1@gmail.com",
              password: "test1234",
              password_confirmation: "test1234")
end
p "Main user was created"
10.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              nickname: Faker::Ancient.god,
              age: rand(50),
              email: Faker::Internet.email,
              password: "test1234",
              password_confirmation: "test1234")
end
p "Regular users were created"
300.times do
  Post.create(title: Faker::Lorem.sentence(word_count: 3),
              date: Date.today,
              body: Faker::Lorem.paragraph(sentence_count: 5),
              user_id: rand(10),
              status: rand(3))
end
p "Posts were created"
