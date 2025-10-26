CREATE TABLE users (
  user_id		INT NOT NULL AUTO_INCREMENT,
  email			VARCHAR(320) UNIQUE NOT NULL,
  name			VARCHAR(255) NOT NULL,
  password		VARCHAR(320) NOT NULL,
  created_at		DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,	
  PRIMARY KEY (user_id)
);

CREATE TABLE zip_zones(
  zip			CHAR(5) NOT NULL,
  usda_zone		VARCHAR(10) NOT NULL,
  PRIMARY KEY (zip)
);

CREATE TABLE locations (
  location_id		INT NOT NULL AUTO_INCREMENT,
  city			VARCHAR(100) NOT NULL,
  state			VARCHAR(50) NOT NULL,
  zip			CHAR(5),
  PRIMARY KEY (location_id),
  FOREIGN KEY (zip) REFERENCES zip_zones(zip) ON DELETE SET NULL
);

CREATE TABLE plots (
  plot_id				INT NOT NULL AUTO_INCREMENT,
  user_id				INT NOT NULL,
  location_id				INT NOT NULL,
  plot_name				VARCHAR(100) NOT NULL,
  area_sq_m				DECIMAL,
  soil_type				VARCHAR(50),
  sunlight_exposure			VARCHAR(100),
  is_active				BOOLEAN,
  PRIMARY KEY (plot_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE CASCADE
);

CREATE TABLE crops (
  crop_id			INT NOT NULL AUTO_INCREMENT,
  crop_name			VARCHAR(100) NOT NULL,
  ideal_soil			VARCHAR(100),
  days_to_maturity		INT,
  sun_req			VARCHAR(20),
  water_req			VARCHAR(20),
  season			VARCHAR(20),
  PRIMARY KEY (crop_id)
);

CREATE TABLE planting_plans (
  plot_id			INT NOT NULL,
  crop_id			INT NOT NULL,
  start_date			DATE NOT NULL,
  end_date			DATE NOT NULL,
  amount			INT,
  PRIMARY KEY (plot_id, crop_id),
  FOREIGN KEY (plot_id) REFERENCES plots(plot_id) ON DELETE CASCADE,
  FOREIGN KEY (crop_id) REFERENCES crops(crop_id) ON DELETE CASCADE
);

CREATE TABLE weather_observations (
  obs_id		INT NOT NULL AUTO_INCREMENT,
  location_id		INT NOT NULL,
  observed_on		DATE NOT NULL,
  tmin_c		DECIMAL NOT NULL,
  tmax_c		DECIMAL NOT NULL,
  precip_mm		DECIMAL,
  humidity_pct		DECIMAL,
  frost_flag		BOOLEAN,
  source		VARCHAR(40) NOT NULL,
  PRIMARY KEY (obs_id),
  FOREIGN KEY (location_id) REFERENCES locations(location_id) ON DELETE CASCADE
);
