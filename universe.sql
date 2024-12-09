create table galaxy(
	galaxy_id serial not null primary key,
	name varchar(20) unique not null,
	age numeric,
	size int,
	planet_junction numeric
);


create table star(
	star_id serial not null primary key,
	name varchar(20)  unique not null,
	galaxy_id int not null,
	age numeric,
	color varchar(10),
	foreign key (galaxy_id) references galaxy(galaxy_id)
);


create table Moon(
	Moon_id serial not null primary key,
	name varchar(20) unique not null,
	description text,
	color varchar(10),
	age_in_millions_of_years int
);

create table planet(
	planet_id serial not null primary key,
	name varchar(20) unique not null,
	star_id int not null,
	has_moon boolean,
	has_living_beings boolean,
	galaxy_id int not null,
	foreign key (star_id) references star(star_id),
	foreign key (galaxy_id) references galaxy(galaxy_id)
);

select * from planet;
SELECT constraint_name, constraint_type
FROM information_schema.table_constraints
WHERE table_name = 'planet';

create table planet_junction(
	planet_junction_id serial not null primary key,
	moon_id int unique not null,
	planet_id int not null,
	name varchar(15),
	foreign key (planet_id) references planet(planet_id),
	foreign key (moon_id) references moon(moon_id)
);

-- Galaxy Table Inserts
INSERT INTO galaxy (name, age) VALUES ('Andromeda Galaxy', 10000);
INSERT INTO galaxy (name, age) VALUES ('Milky Way Galaxy', 32000);
INSERT INTO galaxy (name, age) VALUES ('Triangulum Galaxy', 30000);
INSERT INTO galaxy (name, age) VALUES ('Whirlpool Galaxy', 12000);
INSERT INTO galaxy (name, age) VALUES ('Sombrero Galaxy', 12010);
INSERT INTO galaxy (name, age) VALUES ('Tadpole', 120202);

-- Star Table Inserts
INSERT INTO star (name, galaxy_id, age) VALUES ('Mirachion', 1, 30000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Cassirion', 1, 32000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Stellarion', 2, 20000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Solaria', 2, 20000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Triax', 3, 30000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Whirlion', 4, 40000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Axia', 5, 30000);
INSERT INTO star (name, galaxy_id, age) VALUES ('Obscura', 6, 30000);

-- Moon Table Inserts
INSERT INTO moon (name, description) VALUES ('Lunaris', 'A large, silver moon with crater lakes.');
INSERT INTO moon (name, description) VALUES ('Eclipso', 'A moon that casts dramatic solar eclipses on Terranova.');
INSERT INTO moon (name, description) VALUES ('Frostalis', 'An icy moon with towering glaciers.');
INSERT INTO moon (name, description) VALUES ('Glacion', 'A moon covered in reflective ice sheets.');
INSERT INTO moon (name, description) VALUES ('Pyros', 'A volcanic moon with constant lava flows.');
INSERT INTO moon (name, description) VALUES ('Cyralis', 'A rocky moon with deep canyons.');
INSERT INTO moon (name, description) VALUES ('Eosil', 'A moon with a thin ring system.');
INSERT INTO moon (name, description) VALUES ('Xyra', 'A dusty, barren moon with hidden caves.');
INSERT INTO moon (name, description) VALUES ('Aqualis', 'A water moon with vast oceanic geysers.');
INSERT INTO moon (name, description) VALUES ('Hydrion', 'A moon with icy rings and underwater life.');
INSERT INTO moon (name, description) VALUES ('Crystalis', 'A moon with glowing crystal fields.');
INSERT INTO moon (name, description) VALUES ('Opalith', 'A multicolored moon with swirling gases.');
INSERT INTO moon (name, description) VALUES ('Spirionix', 'A glowing oceanic world.');
INSERT INTO moon (name, description) VALUES ('Auralith', 'A rocky planet with aurora-filled skies.');
INSERT INTO moon (name, description) VALUES ('Nytheros', 'A dark, enigmatic planet veiled in mist.');
INSERT INTO moon (name, description) VALUES ('Veyloris', 'A planet with reflective, crystal-like surfaces.');
INSERT INTO moon (name, description) VALUES ('Drelthos', 'A volcanic, red-glowing world.');
INSERT INTO moon (name, description) VALUES ('Drakoron', 'A lava-drenched planet with dragon-like life forms.');
INSERT INTO moon (name, description) VALUES ('Voidarion', 'A planet with deep, endless craters.');
INSERT INTO moon (name, description) VALUES ('Umbraxis', 'A shadowy world with faint bioluminescent flora.');
INSERT INTO moon (name, description) VALUES ('Auralis', 'A peaceful planet with rainbow-like skies.');

-- Planet Table Inserts
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Androsia', 1, FALSE, FALSE, 1);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Mirathea', 1, FALSE, FALSE, 1);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Zerathis', 2, TRUE, FALSE, 2);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Terranova', 2, FALSE, FALSE, 2);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Cryonix', 3, FALSE, FALSE, 3);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Valkarion', 4, FALSE, FALSE, 3);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Triadex', 5, FALSE, FALSE, 4);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Lumora', 5, FALSE, FALSE, 4);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Quorath', 6, FALSE, FALSE, 5);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Cyclonea', 7, FALSE, FALSE, 5);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Spiralis', 6, FALSE, FALSE, 6);
INSERT INTO planet (name, star_id, has_moon, has_living_beings, galaxy_id) VALUES ('Orionix', 8, FALSE, FALSE, 6);



alter table moon 
add column planet_id int ,
add foreign key (planet_id) references planet(planet_id);


ALTER TABLE moon ADD COLUMN temp_id SERIAL;
UPDATE moon
SET planet_id = ((temp_id - 1) % 12) + 1;
ALTER TABLE moon DROP COLUMN temp_id;


INSERT INTO planet_junction (moon_id, planet_id) VALUES (1, 3);  -- Lunaris belongs to Zerathis
INSERT INTO planet_junction (moon_id, planet_id) VALUES (2, 3);  -- Eclipso belongs to Zerathis
INSERT INTO planet_junction (moon_id, planet_id) VALUES (3, 3);  -- Frostalis belongs to Zerathis
INSERT INTO planet_junction (moon_id, planet_id) VALUES (4, 3);  -- Glacion belongs to Zerathis
INSERT INTO planet_junction (moon_id, planet_id) VALUES (5, 11); -- Pyros belongs to Spiralis
INSERT INTO planet_junction (moon_id, planet_id) VALUES (6, 11); -- Cyralis belongs to Spiralis
INSERT INTO planet_junction (moon_id, planet_id) VALUES (7, 9);  -- Aqualis belongs to Quorath
INSERT INTO planet_junction (moon_id, planet_id) VALUES (8, 9);  -- Hydrion belongs to Quorath
INSERT INTO planet_junction (moon_id, planet_id) VALUES (9, 12); -- Crystalis belongs to Orionix
INSERT INTO planet_junction (moon_id, planet_id) VALUES (10, 12); -- Opalith belongs to Orionix


	
select * from galaxy;
select * from star;
select * from planet;
select * from moon;
select * from planet_junction;
