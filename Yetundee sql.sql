  create database ecommerce;
   create table products(
  productname varchar(100) not null,
  product_id int auto_increment primary key,
  price_in_naira int not null,
  category varchar(100)
 );

 create table sellers(
seller_id int auto_increment primary key,
name varchar(20) not null,
email varchar(20)not null unique,
phoneno varchar(20) not null,
add_product varchar(20)not null,
typeofproduct varchar(20) not null
);

create table carts(
cart_id int auto_increment primary key,
items varchar(250) not null,
product_id int
);

create table orders(
order_id int auto_increment primary key,
items varchar(200) not null
);

create table buyers(
buyer_id int auto_increment primary key,
cart_id int,
product_id int
);


create table discounts(
productname varchar(50) not null,
price int not null,
discount_in_percentage int not null,
newprice int not null
);

create table payments(
mode_of_payment varchar(50) not null,
amount_to_pay int not null,
buyer_id int
);

create table product_seller(
 seller_id int,
 product_id int,
 foreign key (seller_id) references sellers(seller_id),
 foreign key (product_id) references products(product_id)
 );
 
  create table buyer_product(
 buyer_id int,
 product_id int,
 foreign key (buyer_id) references buyers(buyer_id),
 foreign key (product_id) references products(product_id)
 );

create table cart_product(
cart_id int,
product_id int,
foreign key (cart_id) references carts(cart_id),
foreign key (product_id) references products(product_id)
);

 create table buyer_order(
 buyer_id int,
 order_id int,
 foreign key (buyer_id) references buyers(buyer_id),
 foreign key (order_id) references orders(order_id)
 );

 create table order_product(
 order_id int,
 product_id int,
 foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
 );