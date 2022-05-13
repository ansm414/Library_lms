# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Role.create(name:"Admin") #-> id 8
Role.create(name:"Reader") #-> id 9


# User.create(email:"bsem-f18-115@superior.edu.pk", role_id: 1, name:"muhammad ans",address: "iqbal town",gender: "male")
# User.create(email:"bsem-f18-115@superior.edu.pk", role_id: 8, name:"muhammad ans",address: "iqbal town",gender: "male",password: 12345678,password_confirmation:12345678)
