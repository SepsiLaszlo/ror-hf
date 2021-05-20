# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
10.times do
  neptun = UsersHelper.generate_neptun
  User.create!(name: Faker::Name.name, neptun: neptun, password: neptun)
end

subjects = ["Analízis", "Grafika", "Mesterséges Inteligencia", "Szoftver technikák"]
subjects.each do |subject|
  Subject.create(name: subject, credit: (1..6).to_a.sample)
end
coures_types = ["Előadás", "Vizsga kurzus","Gyakorlat", "Labor"]

coures_types.each do |course_type|
  CourseType.create(name: course_type)
end

Subject.all.each do |subject|
  CourseType.all[0..1].each do |course_type|
    Course.create(subject: subject, course_type: course_type, number: 1)
  end

  CourseType.all[2..3].each do |course_type|
    5.times do |index|
      Course.create(subject: subject, course_type: course_type, number: index)
    end
  end
end


