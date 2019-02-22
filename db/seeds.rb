require 'json'
require 'open-uri'

html_file = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients = JSON.parse(html_file)

puts 'parsing for ingredients'

ingredients['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end

puts 'finshed seeding ingredients'

html_cocktails = open('https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail').read
cocktails = JSON.parse(html_cocktails)

puts 'parsing for cocktails'

cocktails['drinks'].each do |cocktail|
  Cocktail.create(name: cocktail['strDrink'])
end

puts 'finshed seeding cocktails'
