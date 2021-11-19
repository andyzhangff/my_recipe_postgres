COPY recipes_title (title, description, category, image, owner)
FROM 'C:\Users\1333018\DataGripProjects\myRecipe\recipes\recipes\recipes.csv'
DELIMITER ','
CSV HEADER;