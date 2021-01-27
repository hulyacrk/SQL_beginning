--SELECT
--ANSII
Select ContactName Adi, CompanyName Sirketadi, City Sehir from Customers

Select * from Customers where City = 'Berlin'
--case insensitive : büyük/küçük harf duyarsızdır.
select * from Products where CategoryId=1 or categoryId=3

select * from Products where CategoryId=1 and unitprice>=10

select * from Products order by unitprice --order by sırala demek. 
select * from products order by unitprice asc --ascending (artan)
select * from products order by unitprice desc --descending (düşen)
select * from products where categoryId=1 order by unitprice desc

select count(*) from Products--product tablosunda kaç data var.
select count(*) from Products where categoryid=2--2 numaralı kategoride kaç ürün var.


--GROUP BY
--hangi kategoride kaç farklı ürünümüz var?
select categoryid,count(*) from products group by categoryid--bütün kategorileri tekrar etmeyecek şekilde listele
--group by olduğu için her bir grup elemanı için ayrıca count hesaplanabilir. 
select categoryid,count(*) from products where unitprice>20 group by categoryid having count(*)<10 --bana 10 taneden az ürün çeşidi olan kategorileri ve fiyatları 20den az olanları ver, ben o kategorilere ürün ekleyerek eksiklerimi tamamlamak istiyorum.
--önce her zaman where çalışır. -- having ler kümülatiflere uygulanır.


--JOIN
select products.ProductID, products.ProductName, products.UnitPrice, Categories.categoryName 
from products inner join categories --ürünlerin ve kategorilerin bir araya getirilmiş şekli
on products.CategoryID = categories.CategoryID -- neye göre birleştireceğini "on" ile yazıyoruz.
--* tüm kolonları getir demek, *yazmadığında hangi kolonları istediğini belirtmen gerekir.
where products.UnitPrice>10

--DTO-Data Transformation Object c# ta buna DTO diyeceğiz.
--inner join sadece iki tabloda da eşleşenleri bir araya getirir. eşleşmeyen data varsa onu getirmez.

select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID 
--hiç satış yapamadığımız ürünler nelerdir? kampanya yapıp ürünleri elimizden çıkaralım.
select * from Products p left join [Order Details] od
on p.ProductID = od.ProductID --solda olup sağda olmayanları da getir demek. tüm ürünler aynı sayıda gelirse tüm ürünlerde satış yapılmış demektir.


select * from Customers c inner join orders o
on c.CustomerID = o.CustomerID
--sistemimize kayıt olmuş ama ürün almamış müşterileri getir. onlara özel indirim yapıp aktif müşteri haline getireceğim.
select * from Customers c left join orders o
on c.CustomerID = o.CustomerID
where o.CustomerID is null --direk o müşterileri gösterir.
--null o data yok demektir. PK ya uygulanır. 

select * from orders o right join customers c
on c.CustomerID = o.CustomerID

--ikiden fazla tabloyu join etmek istersek;
select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
inner join Orders o
on o.OrderID = od.OrderID
















