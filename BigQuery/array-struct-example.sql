# Create a simple array with square brackets
#standardSQL
CREATE OR REPLACE TABLE `array-and-struct.array.restaurant_cuisine` AS (
SELECT "Cafe Paci" AS name, "Newtown" AS location, ["European", "Casual", "Wine bar"] AS cuisine_array
UNION ALL
SELECT "Ho Jiak" AS name, "Haymarket" AS location, ["Malaysian", "Street-food"] AS cuisine_array
UNION ALL
SELECT "Spice I Am" AS name, "Surry Hills" AS location, ["Thai", "Casual"] AS cuisine_array
UNION ALL
SELECT "Chaco Bar" AS name, "Potts Point" AS location, ["Japanese", "Yakitori", "Casual"] AS cuisine_array);


# Break open an array with UNNEST
#standardSQL
SELECT name, location, cuisine
FROM `array-and-struct.array.restaurant_cuisine`, UNNEST(cuisine_array) AS cuisine;



# Aggregate elements into arrays with ARRAY_AGG
#standardSQL
SELECT name, location, ARRAY_AGG(cuisine ORDER BY cuisine) AS cuisine_array
FROM `array-and-struct.array.restaurant_cuisine_unnested`
GROUP BY name, location;


# Count the elements in an array with ARRAY_LENGTH
#standardSQL
SELECT name, ARRAY_LENGTH(cuisine_array) AS number_of_label
FROM `array-and-struct.array.restaurant_cuisine`;



#standardSQL
# Unpack cuisine_array
SELECT name, location, cuisine
FROM `array-and-struct.array.restaurant_cuisine`, UNNEST(cuisine_array) AS cuisine

# Filter only restaurants contain "Casual" label
WHERE "Casual" IN UNNEST(cuisine_array);


#standardSQL
SELECT *
FROM `array.restaurant_cuisine`
# Filter only restaurants contain "Casual" labels
WHERE "Casual" IN UNNEST(cuisine_array);


# Create a simple struct
#standardSQL
CREATE OR REPLACE TABLE `array-and-struct.struct.restaurant_cuisine` AS (
SELECT "Cafe Paci" AS name, "Newtown" AS location,
STRUCT(["European", "Casual", "Wine bar"] AS cuisine_array, "$$$" AS price_range, False AS has_delivery) AS basic_info
UNION ALL
SELECT "Ho Jiak" AS name, "Haymarket" AS location,
STRUCT(["Malaysian", "Street-food"] AS cuisine_array, "$$" AS price_range, True AS has_delivery) AS basic_info
UNION ALL
SELECT "Spice I Am" AS name, "Surry Hills" AS location,
STRUCT(["Thai", "Casual"] AS cuisine_array, "$$" AS price_range, True AS has_delivery) AS basic_info
UNION ALL
SELECT "Chaco Bar" AS name, "Potts Point" AS location,
STRUCT(["Japanese", "Yakitori", "Casual"] AS cuisine_array, "$$" AS price_range, False AS has_delivery) AS basic_info);



# Query a struct with DOT NOTATION
#standardSQL

# Filter casual restaurants with delivery service
WITH casual_delivery AS (
SELECT name, location, basic_info.price_range AS price_range, cuisine
FROM `array-and-struct.struct.restaurant_cuisine`, UNNEST(basic_info.cuisine_array) AS cuisine
WHERE basic_info.has_delivery = true
AND "Casual" IN UNNEST(basic_info.cuisine_array))

#Regroup cuisine into array for final query result
SELECT name, location, price_range, ARRAY_AGG(cuisine) AS cuisine
FROM casual_delivery
GROUP BY name, location, price_range;



# Create nested records from arrays of structs
#standardSQL
CREATE OR REPLACE TABLE `array-and-struct.struct.aus_restaurant` AS (
SELECT "Sydney" as city, [
STRUCT("Cafe Paci" AS name, "Newtown" AS location, STRUCT(["European", "Casual", "Wine bar"] AS cuisine_array, "$$$" AS price_range, False AS has_delivery) AS basic_info),
STRUCT("Ho Jiak" AS name, "Haymarket" AS location, STRUCT(["Malaysian", "Street-food"] AS cuisine_array, "$$" AS price_range, True AS has_delivery) AS basic_info),
STRUCT("Spice I Am" AS name, "Surry Hills" AS location, STRUCT(["Thai", "Casual"] AS cuisine_array, "$$" AS price_range, True AS has_delivery) AS basic_info),
STRUCT("Chaco Bar" AS name, "Potts Point" AS location, STRUCT(["Japanese", "Yakitori", "Casual"] AS cuisine_array, "$$" AS price_range, False AS has_delivery) AS basic_info)] AS restaurant

UNION ALL

SELECT "Wollongong" as city, [
STRUCT("Pizzeria 50" AS name, "Wollongong" AS location, STRUCT(["Pizza"] AS cuisine_array, "$" AS price_range, False AS has_delivery) AS basic_info),
STRUCT("Debutant" AS name, "Wollongong" AS location, STRUCT(["French", "Bistro"] AS cuisine_array, "$$$" AS price_range, False AS has_delivery) AS basic_info)] AS restaurant);
