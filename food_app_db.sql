create database food_app_db;

use food_app_db;

create table users(
	id int auto_increment,
    user_name varchar(100),
    pass varchar(50),
    type_login varchar(50),
    primary key(id)
);

create table states(
	id int auto_increment,
    state_name varchar(100),
    primary key(id)
);

create table cities(
	id int auto_increment,
    city_name varchar(100),
    state_id int,
    foreign key(state_id) references states(id),
    primary key(id)
);

create table user_details(
	user_id int,
    full_name varchar(255),
    email varchar(100),
    phone tinyint,
    city_id int,
    state_id int,
    foreign key(city_id) references cities(id),
    foreign key(state_id) references cities(state_id),
    primary key(user_id)
);

create table restaurants (
	id int auto_increment,
    restaurant_name varchar(255),
    restaurant_address varchar(255),
    img_url varchar(255),
    primary key(id)
);

create table reviews(
	id int auto_increment,
    user_id int,
    restaurant_id int,
    rating tinyint,
    content text,
    foreign key(user_id) references users(id),
	foreign key(restaurant_id) references restaurants(id),
    primary key(id)
);

create table categories(
	id int auto_increment,
    category_name varchar(100),
    primary key(id)
);

create table promotions(
	id int auto_increment,
    discount varchar(255),
    expired_date datetime,
    describes text,
    primary key(id)
);

create table menu(
	id int auto_increment,
    menu_name varchar(255),
    price int,
    restaurant_id int,
    img_url varchar(255),
    rating tinyint,
    category_id int,
    promotions_id int,
    describes varchar(255),
    foreign key(restaurant_id) references restaurants(id),
    foreign key(category_id) references categories(id),
    foreign key(promotions_id) references promotions(id),
    primary key(id)
);

create table submenu(
	id int auto_increment,
    submenu_name varchar(255),
    price int,
    restaurant_id int,
    foreign key(restaurant_id) references restaurants(id),
    primary key(id)
);

create table menu_details(
	id int auto_increment,
    menu_id int,
    submenu_id int,
    foreign key(menu_id) references menu(id),
    foreign key(submenu_id) references submenu(id),
    primary key(id)
);

create table status_order(
	id int auto_increment,
    status_name varchar(50),
    primary key(id)
);

create table orders(
	id int auto_increment,
	user_id int,
    status_id int,
    start_time datetime,
    end_time datetime,
    foreign key(user_id) references users(id),
    foreign key(status_id) references status_order(id),
    primary key(id)
);

create table order_details(
	order_id int,
    menu_id int,
    amount int,
    price int,
    status_id int,
    foreign key(order_id) references orders(id),
    foreign key(menu_id) references menu(id),
    foreign key(status_id) references status_order(id),
    primary key(order_id)
);