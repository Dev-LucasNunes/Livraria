# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Adiciona autores pré-cadastrados
Author.create(name: "Maria Silva", nationality: "Brasileira", cpf: "123.456.789-00", date_of_birth: Date.new(1980, 5, 15))
Author.create(name: "Juan Martinez", nationality: "Mexicano", cpf: "987.654.321-00", date_of_birth: Date.new(1975, 11, 20))
Author.create(name: "Sophie Dupont", nationality: "Francesa", cpf: "456.789.123-00", date_of_birth: Date.new(1990, 9, 3))
Author.create(name: "Ahmed Khan", nationality: "Indiano", cpf: "654.321.987-00", date_of_birth: Date.new(1988, 7, 25))
Author.create(name: "Elena Petrov", nationality: "Russa", cpf: "789.123.456-00", date_of_birth: Date.new(1972, 12, 10))
Author.create(name: "Pedro Alvarez", nationality: "Espanhol", cpf: "321.654.987-00", date_of_birth: Date.new(1985, 6, 18))
Author.create(name: "Li Wei", nationality: "Chinesa", cpf: "987.123.456-00", date_of_birth: Date.new(1979, 4, 5))
Author.create(name: "Anna Nowak", nationality: "Polonesa", cpf: "654.987.321-00", date_of_birth: Date.new(1995, 8, 29))
Author.create(name: "Giovanni Rossi", nationality: "Italiano", cpf: "123.789.456-00", date_of_birth: Date.new(1983, 2, 12))
Author.create(name: "Fatima Ahmed", nationality: "Egípcia", cpf: "456.321.789-00", date_of_birth: Date.new(1977, 7, 8))
# Adicione os outros 10 autores aqui...

puts "Autores adicionados com sucesso!"
