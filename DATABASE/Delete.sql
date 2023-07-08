USE NaneShop
GO

select * from categories
select * from accounts
select * from products
select * from roles
select * from cart
select * from cart_item
select * from orders

delete categories
delete roles
delete cart
delete orders
delete accounts
delete products
delete cart_item
delete order_details
delete reviews

DBCC CHECKIDENT ('accounts', RESEED, 0)
DBCC CHECKIDENT ('cart_item', RESEED, 0)
DBCC CHECKIDENT ('categories', RESEED, 0)
DBCC CHECKIDENT ('products', RESEED, 0)



