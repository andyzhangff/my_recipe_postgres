SELECT u.username,
       u.avatar,
       recipes_title.title,
       recipes_title.description,
       recipes_title.category,
       recipes_title.image,
       recipes_title.id
FROM recipes_title
         JOIN users u on recipes_title.owner = u.username
         JOIN ratings r on recipes_title.id = r.recipe_id
WHERE r."user"='andyzhangff' and r.favorite=true;



