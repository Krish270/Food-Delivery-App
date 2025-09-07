sql

--Sample users and their respective data
INSERT INTO users (name, email, password_hash, role) VALUES
('Alice Johnson', 'alice@example.com', 'hashedpassword1', 'CUSTOMER'),
('Bobby Builder', 'bobby@example.com', 'hashedpassword2', 'RESTAURANT_OWNER'),
('Charlie Chen', 'charlie@example.com', 'hashedpassword3', 'CUSTOMER'),
('Diana Patel', 'diana@example.com', 'hashedpassword4', 'RESTAURANT_OWNER'),
('Krish Admin', 'krish@example.com', 'hashedpassword5', 'ADMIN');

--Restaurant names 
INSERT INTO restaurants (owner_id, name, address, city, postcode, is_approved) VALUES
(2, 'Krishys Curry Muncher', '123 Food Street', 'London', '12345', TRUE);
(4, 'Dianas Pizzeria', '456 Pizza Ave', 'Birmingham', '54321', TRUE);

--Menu Items
INSERT INTO menu_items (restuarant_id, name, description, price_cents, is_available) VALUES
--Krish menu
(1, 'Chicken Tikka Masala', 'Mouthwatering HOT BOMBAY Curry', 999, TRUE),
(1, 'Butter Chicken', 'Sweet and Tangy Curry', 899, TRUE);
(1, 'Lassi', 'Sweet Milkshake', 499, TRUE),
(1, 'Fries', 'Crispy Golden fries', 299, TRUE),


--Diana's Menu
(2, 'Margherita Pizza', 'Fresh mozzarella, tomatoes and basil', 1099, TRUE),
(2, 'Pepperoni Pizza', 'Classic pepperoni with mozzarella', 1299, TRUE),
(2, 'BBQ Chicken Pizza', 'Grilled chicken, BBQ sauce and onions', 1399, TRUE),
(2, 'Garlic Bread', 'Toasted Garlic bread with butter', 399, TRUE);

-- Cart Example (Alice at Krishy)
INSERT INTO carts (user_id, restuarant_id, total_cents) VALUES
(1, 1, 1198);

-- Cart Items
INSERT INTO cart_items (cart_id, menu_item_id, quantity, price_cents) VALUES
(1, 1, 1, 899), -- Butter Chicken
(1, 1, 1, 299); -- Fries

-- Orders
INSERT INTO orders (user_id, restuarant_id, address, status, total_cents, payment_status) VALUES
(1, 1, '123 Customer Lane, London', 'OUT_FOR_DELIVERY', 1198, 'PAID'),
(3, 2, '456 Hungry Road, Pizzatown', 'PREPARING', 1299, 'PENDING');

-- Order Items (snapshot)
INSERT INTO order_items (order_id, menu_item_id, name_snapshot, price_cents, quantity) VALUES
(1, 1, 'Chicken Tikka Masala', 899, 1),
(1, 3, 'Fries', 299, 1),
(2, 6, 'Pepperoni Pizza', 1299, 1);

-- Payments
INSERT INTO payments (order_id, provider, status, amount_cents, transaction_id) VALUES
(1, 'STRIPE', 'SUCCEEDED', 1198, 'txn_12345'),
(2, 'STRIPE', 'REQUIRES_PAYMENT', 1299, NULL);

-- Couriers
INSERT INTO couriers (name, phone, current_lat, current_lng, is_active) VALUES
('Frank Rider', '+441234567890', 40.712776, -74.005974, TRUE),
('Grace Courier', '+440987654321', 34.052235, -118.243683, TRUE);


-- Deliveries
INSERT INTO deliveries (order_id, courier_id, started_at, last_lat, last_lng, eta_seconds) VALUES
(1, 1, NOW(), 40.712776, -74.005974, 600);