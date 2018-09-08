# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


for a in 'a'..'e'
  Klass.create(name: a)
end

for i in 1..8
  Student.create(name: "s#{i}", klass_id: (i/2.0).ceil)
end


for i in 1..8
  Score.create(total: rand(100), student_id: i, klass_id: (i/2.0).ceil)
end
