SELECT u.username,
       u.avatar,
       title,
       description,
       category,
       image,
       recipes.id
FROM recipes
         JOIN users u on recipes.owner_id = u.id
OFFSET 0
LIMIT 10


