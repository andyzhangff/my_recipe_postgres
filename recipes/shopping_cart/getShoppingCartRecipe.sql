SELECT
recipes_title.id,
recipes_title.title,
recipes_title.image
FROM recipes.public.recipes_title
JOIN shopping_cart sc on recipes_title.id = sc.recipe_id
WHERE sc.username='andyzhangff';