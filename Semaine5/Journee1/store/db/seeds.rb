# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Nettoyer la base d'abord
Gossip.destroy_all
User.destroy_all

# Créer des utilisateurs
alice = User.create!(first_name: "Alice", last_name: "Dupont", email: "alice@mail.com", age: 28)
bob   = User.create!(first_name: "Bob",   last_name: "Martin", email: "bob@mail.com",   age: 32)

# Créer des potins
Gossip.create!(title: "Scandale au bureau !", content: "Il paraît que quelqu'un mange le repas des autres dans le frigo...", user: alice)
Gossip.create!(title: "Rumeur de soirée",     content: "On dit que la fête de vendredi va être légendaire.", user: bob)
Gossip.create!(title: "Mystère au 3ème",      content: "Personne ne sait qui a commandé 12 pizzas hier soir.", user: alice)