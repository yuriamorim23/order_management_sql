Querys


SELECT CLIENT.client_id, CLIENT.firstname, order_items.price
FROM CLIENT, order_items
WHERE CLIENT.client_id = order_items.order_items_id AND order_items.price > 50.00;

SELECT * FROM order_client
INNER JOIN client
ON client.client_id = order_client.order_id

SELECT client_id, status
FROM order_client
WHERE status = "OPEN"

SELECT client.client_id, CLIENT.firstname, CLIENT.phonenumber, CLIENT.email, order_client.date, order_client.status
FROM client
INNER JOIN order_client
ON client.client_id = order_client.client_id