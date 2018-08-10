
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS payments;

DROP TABLE IF EXISTS persons_memberships;
DROP TABLE IF EXISTS persons_sessions;
DROP TABLE IF EXISTS sessions;
DROP TABLE IF EXISTS persons;

DROP TABLE IF EXISTS memberships;

DROP TABLE IF EXISTS playlist_songs;
DROP TABLE IF EXISTS gym_classes_categories;
DROP TABLE IF EXISTS gym_classes;

DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS membership_types;

DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS gym_class_categories;
DROP TABLE IF EXISTS intensities;
DROP TABLE IF EXISTS songs;

CREATE TABLE songs(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  artist VARCHAR(255),
  duration INTERVAL
);

CREATE TABLE intensities(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE gym_class_categories(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE rooms(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE membership_types(
 id SERIAL8 PRIMARY KEY,
 name VARCHAR(255),
 description VARCHAR(255)
);

CREATE TABLE roles(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE gym_classes(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
  description TEXT,
  intensity_id INT REFERENCES intesities(id) ON DELETE CASCADE
);

CREATE TABLE gym_class_categories(
  id SERIAL8 PRIMARY KEY,
  class_id INT REFERENCES gym_classes(id) ON DELETE CASCADE
);

CREATE TABLE playlist_songs(
  id SERIAL8 PRIMARY KEY,
  class_id INT REFERENCES gym_classes(id) ON DELETE CASCADE
);

CREATE TABLE memberships(
  id SERIAL8 PRIMARY KEY,
  membership_number INT,
  start_date TIMESTAMP,
  end_date TIMESTAMP,
  membership_type_id INT REFERENCES membership_types(id) ON DELETE CASCADE
);

CREATE TABLE persons(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  street_address VARCHAR(255),
  city VARCHAR(255),
  postcode VARCHAR(255),
  telephone_number VARCHAR(255),
  mobile_number VARCHAR(255),
  email_address VARCHAR(255),
  photo_url VARCHAR(255),
  role_id INT REFERENCES roles(id) ON DELETE CASCADE
);

CREATE TABLE sessions(
  id SERIAL8 PRIMARY KEY,
  session_date DATE,
  start_time TIME,
  end_time TIME,
  capacity INT,
  gym_class_id INT REFERENCES gym_classes(id) ON DELETE CASCADE,
  intructor_id INT REFERENCES persons(id) ON DELETE CASCADE,
  room_id INT REFERENCES rooms(id) ON DELETE CASCADE
);

CREATE TABLE persons_sessions(
  id SERIAL8 PRIMARY KEY,
  date_time_added TIMESTAMP,
  reserve BOOLEAN,
  person_id INT REFERENCES persons(id) ON DELETE CASCADE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);

CREATE TABLE persons_memberships(
  id SERIAL8 PRIMARY KEY,
  person_id INT REFERENCES pesons(id) ON DELETE CASCADE,
  membership_id INT REFERENCES memberships(id) ON DELETE CASCADE
);

CREATE TABLE payments(
  id SERIAL8 PRIMARY KEY,
  description VARCHAR(255),
  amount DECIMAL,
  person_id INT REFERENCES pesons(id) ON DELETE CASCADE
);


CREATE TABLE messages(
  id SERIAL8 PRIMARY KEY,
  message TEXT,
  date_time_added TIMESTAMP,
  person_id INT REFERENCES persons(id) ON DELETE CASCADE
);