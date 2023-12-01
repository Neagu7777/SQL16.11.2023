В рамках БД "онлайн-магазин" напишите след/запросы:


--Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT
    ProductName,
    MAX(Price * 0.85) AS MaxPriceUSD
FROM
    Products
-------------------------------------------------------------------------------
--Вывести название и стоимость в `USD` одного самого дорогого товара
SELECT
    ProductName,
    Price * 1.09 AS max_price_usd
FROM Products
ORDER BY
    max_price_usd DESC
LIMIT 1
-----------------------------------------------------------------------------
--Вывести два самых дорогих товара из категории Beverages из USA
SELECT
    Products.ProductName,
    Products.Price,
    Suppliers.SupplierName
FROM
    Products
JOIN
    Categories ON Products.CategoryID = Categories.CategoryID
JOIN
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
WHERE
    Categories.CategoryName = 'Beverages'
    
ORDER BY
    Products.Price DESC
LIMIT 2    


-------------------------------------------------------------------------------------
Удалить товары с ценой менее 50 EUR
DELETE FROM Products
WHERE PriceEUR < 50
----------------------------------------------------------------------------------------
Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
    Suppliers.Country
FROM
    Products
JOIN
    Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN
    Categories ON Products.CategoryID = Categories.CategoryID
WHERE
    Categories.CategoryName = 'Seafood'

-----------------------------------------------------------------------------------------------
Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET ContactName = NULL
WHERE Country <> 'China'


