DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS brands;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS beers_orders;

CREATE TABLE countries(
  id INTEGER PRIMARY KEY ASC,
  name TEXT
);

CREATE TABLE customers(
  id INTEGER PRIMARY KEY ASC,
  first_name TEXT, 
  last_name TEXT, 
  email TEXT, 
  country_id INTEGER,
  CONSTRAINT con_fk_countries
    FOREIGN KEY(country_id) 
    REFERENCES countries(id)
);

CREATE TABLE orders(
  id INTEGER PRIMARY KEY ASC,
  date TEXT,
  customer_id INTEGER,
  CONSTRAINT con_fk_customers
    FOREIGN KEY(customer_id) 
    REFERENCES customers(id)
    ON DELETE CASCADE
);

CREATE TABLE breweries(
  id INTEGER PRIMARY KEY ASC,
  name TEXT,
  estdate TEXT
);

CREATE TABLE brands(
  id INTEGER PRIMARY KEY ASC,
  name TEXT,
  brewery_id INTEGER,
  CONSTRAINT con_fk_breweries 
    FOREIGN KEY(brewery_id) 
    REFERENCES breweries(id)
    ON DELETE CASCADE
);

CREATE TABLE beers(
  id INTEGER PRIMARY KEY ASC,
  flavor TEXT,
  contents INTEGER,
  alcvol REAL,
  unit_price INTEGER,
  name TEXT,
  brand_id INTEGER,
  CONSTRAINT con_fk_brands
    FOREIGN KEY(brand_id) 
    REFERENCES brands(id) 
    ON DELETE CASCADE
);

CREATE TABLE beers_orders(
  date TEXT,
  order_id INTEGER,
  beer_id INTEGER,
  CONSTRAINT con_fk_orders
    FOREIGN KEY(order_id) 
    REFERENCES orders(id)
    ON DELETE CASCADE,
  CONSTRAINT con_fk_beers
    FOREIGN KEY(beer_id)
    REFERENCES beers(id)
    ON DELETE CASCADE,
  CONSTRAINT con_beers_orders_pk 
    PRIMARY KEY(order_id, beer_id)
);

.schema
pragma table_info('countries');
pragma table_info('customers');
pragma table_info('orders');
pragma table_info('breweries');
pragma table_info('brands');
pragma table_info('beers');
pragma table_info('beers_orders');
