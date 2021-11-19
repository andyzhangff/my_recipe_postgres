SELECT u.username,
       u.avatar,
       title,
       description,
       category,
       image,
       recipes_title.id
FROM recipes_title
         JOIN users u on recipes_title.owner = u.id
OFFSET 0
LIMIT 10


