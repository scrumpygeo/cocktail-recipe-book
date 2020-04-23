require 'open-uri'
require 'json'

puts "Deleting cocktails and doses"
Cocktail.destroy_all
Dose.destroy_all

puts "Deleting old ingredients"

Ingredient.destroy_all


URL = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(URL).read

ingredients = JSON.parse(serialized_ingredients)

puts "Creating new ingredients..."

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

# extras
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "ice")

puts "Created #{Ingredient.count} ingredients."