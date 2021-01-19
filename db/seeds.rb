# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "1@1.com", full_name: 'Luis Eduardo Sequeda Loaiza',
   type_of_id: 'Cedula de ciudadania', number_of_id: '1047777777',telephone: '111111111',position: 'Gerente General',
  date_of_birth: '04/09/1994',working_since: '01/01/2020')
