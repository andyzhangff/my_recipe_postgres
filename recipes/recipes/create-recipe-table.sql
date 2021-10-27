CREATE TABLE recipes (
	id serial PRIMARY KEY,
	title VARCHAR ( 50 ) UNIQUE NOT NULL,
	description VARCHAR ( 500 ),
	category VARCHAR ( 50 ) UNIQUE NOT NULL,
	image VARCHAR ( 255 )  NOT NULL )
