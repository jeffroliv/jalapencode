CREATE DATABASE `jalapeno`;

CREATE TABLE INVENTORY (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL DEFAULT 0,
  quantity INT NOT NULL,
  heat_rate INT NOT NULL,
  cat_id INT NOT NULL,
  image VARCHAR(255) NULL,
  review LONGTEXT NULL
);

CREATE TABLE CATEGORY (
  cate_id INT NOT NULL,
  category VARCHAR(20) NOT NULL,
  FOREIGN KEY (cate_id) REFERENCES INVENTORY(cat_id)
);

CREATE TABLE HEAT_RATING (
  heat_id INT NOT NULL,
  heat VARCHAR(20) NOT NULL,
  FOREIGN KEY (heat_id) REFERENCES INVENTORY(heat_rate)
);

CREATE TABLE ACCOUNT (
  acc_id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  password VARCHAR(20) NOT NULL,
  addr_num INT(10) NOT NULL,
  addr_street VARCHAR(20) NOT NULL 
);

CREATE TABLE TRANSACTION_HISTORY (
  id_num_t INT(100) NOT NULL AUTO_INCREMENT,
  prod_name_t VARCHAR(255) NOT NULL,
  price_t DECIMAL(10,2) NOT NULL DEFAULT 0,
  heat_rate_t INT NOT NULL, #reference to heat rating
  category_t INT NOT NULL, #reference to category 
  image_t VARCHAR(255) NULL,
  FOREIGN KEY (id_num) REFERENCES INVENTORY(id),
  FOREIGN KEY (prod_name_t) REFERENCES INVENTORY(product_name),
  FOREIGN KEY (price_t) REFERENCES INVENTORY(price),
  FOREIGN KEY (image_t) REFERENCES INVENTORY(image),
  FOREIGN KEY (heat_rate_t) REFERENCES HEAT_RATING(heat_id),
  FOREIGN KEY (category_t) REFERENCES CATEGORY(cate_id)
);

CREATE TABLE CART (
  cart_id INT(100) NOT NULL
  id_num_cart INT(100) NOT NULL, #reference product id 
  acc_id_cart INT(100) NOT NULL, #references account
  prod_name_cart VARCHAR(255) NOT NULL,
  price_cart DECIMAL(10,2) NOT NULL DEFAULT 0,
  quantity_cart INT(300) NULL,
  heat_rate_cart INT NOT NULL,
  category_cart INT NOT NULL,
  image_cart VARCHAR(255) NULL,
  sub_total DECIMAL(10,2) DEFAULT 0,
  total DECIMAL(10,2) DEFAULT 0,
  FOREIGN KEY (id_num_cart) REFERENCES INVENTORY(id),
  FOREIGN KEY (acc_id_cart) REFERENCES ACCOUNT(acc_id),
  FOREIGN KEY (prod_name_cart) REFERENCES INVENTORY(product_name),
  FOREIGN KEY (price_cart) REFERENCES INVENTORY(price),
  FOREIGN KEY (quantity_cart) REFERENCES INVENTORY(quantity),
  FOREIGN KEY (heat_rate_cart) REFERENCES HEAT_RATING(heat_id),
  FOREIGN KEY (category_cart) REFERENCES CATEGORY(cate_id),
  FOREIGN KEY (image_cart) REFERENCES INVENTORY(image),
  FOREIGN KEY (cart_id) REFERENCES ACCOUNT(acc_id)
);