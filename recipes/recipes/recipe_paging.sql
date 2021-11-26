SELECT  recipes_title.id,
        recipes_title.title,
        recipes_title.description,
        recipes_title.image,
        recipes_title.owner,
        u.avatar
FROM recipes_title
    JOIN users u on recipes_title.owner = u.username
WHERE recipes_title.id > 60 and category='beef'
ORDER BY recipes_title.id
LIMIT 7;

SELECT  recipes_title.id
FROM recipes_title
    JOIN users u on recipes_title.owner = u.username
WHERE recipes_title.id > 60 and category='beef'
ORDER BY recipes_title.id
OFFSET 7
LIMIT 1;