<?php

require_once('config.php');

$dbname = "jalapeno";

$result = $conn->select_db($dbname);

if($result == true){
    $conn->query("DROP DATABASE {$dbname}") or die("Cannot drop db");
}

echo "<br /> BREAK 1 <br />";

$result = $conn->query("CREATE DATABASE {$dbname}");
if($result == false){
    echo "Fail to create database";
}

echo "<br /> BREAK 2 <br />";

    $conn->select_db($dbname);
    // Select database
    if($conn->error){
        die("Cannot select database " . $conn->error);
    }else{
        //echo "Database selected";
    }


$sql = "
CREATE TABLE INVENTORY (
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cat_id INT(10) NOT NULL,
  product_name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  price DECIMAL(10,2) NOT NULL DEFAULT 0,
  quantity INT(10) NOT NULL,
  heat_id INT(10) NOT NULL,
  image VARCHAR(255) NULL,
  review LONGTEXT NULL,
  recipe_id1 INT(10) NOT NULL,
  recipe_image1 VARCHAR(255) NOT NULL,
  recipe_name1 VARCHAR(255) NOT NULL
  recipe_id2 INT(10) NOT NULL,
  recipe_image2 VARCHAR(255) NOT NULL,
  recipe_name2 VARCHAR(255) NOT NULL,
  recipe_id3 INT(10) NOT NULL,
  recipe_image3 VARCHAR(255) NOT NULL,
  recipe_name3 VARCHAR(255) NOT NULL
);



CREATE TABLE CATEGORY(
  id INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cat_name VARCHAR(100) NOT NULL
);

CREATE TABLE ACCOUNT (
  id INT(100) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cart_id INT NOT NULL,
  fname VARCHAR(30) NOT NULL,
  lname VARCHAR(30) NOT NULL,
  username VARCHAR(30) NOT NULL UNIQUE,
  password VARCHAR(20) NOT NULL,
  email VARCHAR(255) NULL,
  addr VARCHAR(255) NOT NULL,
  addr_2 VARCHAR(255) NULL,
  addr_city VARCHAR(255) NOT NULL,
  addr_state VARCHAR(2) NOT NULL,
  addr_zipcode VARCHAR(6) NOT NULL,
  trans_hist_id INT(10) NULL
);

CREATE TABLE TRANSACTION_HISTORY(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  acc_id INT NOT NULL,
  inventory_id INT NOT NULL,
  date_purchased DATE NOT NULL,
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE CART (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  inventory_id INT(100) NOT NULL,
  quantity INT NOT NULL
);";


if(!$conn->multi_query($sql)){
    echo "Fail to create database" . $conn->error . "<br />";
}else{
    echo "SUCCESS!" . "<br />";
    while ($conn->next_result()) {;} // flush multi_queries
    require_once("generate_data.php");
}

// Generate data





?>
