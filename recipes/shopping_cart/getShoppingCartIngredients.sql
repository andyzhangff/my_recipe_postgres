SELECT
ingredients_sample.image,
'andyzhangff' as username,
recipe_ingredients.ingredient,
recipe_ingredients.quantity,
recipe_ingredients.container,
ingredient_price.price,
recipe_ingredients.recipe_id
FROM recipe_ingredients
JOIN ingredients_sample on ingredients_sample.description = recipe_ingredients.ingredient
JOIN ingredient_price on ingredient_price.ingredient = recipe_ingredients.ingredient
WHERE recipe_ingredients.recipe_id=40;