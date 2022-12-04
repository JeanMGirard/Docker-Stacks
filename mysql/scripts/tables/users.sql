CREATE TABLE IF NOT EXISTS products(
  noproduit int NOT NULL AUTO_INCREMENT,
  nom varchar(255),
  details TEXT,
  prix DECIMAL(10,2),
  PRIMARY KEY (noproduit)
)  CHARSET utf8;