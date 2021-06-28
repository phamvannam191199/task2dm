USE AdventureWorks2019
SELECT * FROM HumanResources.Employee
GO
--biến toàn cục
DECLARE @depID INT --KHAI BÁO BIẾN
SELECT @depID=1 --GÁN GIÁ TRỊ CHO BIẾN 
SELECT Name, GroupName FROM HumanResources.Department WHERE DepartmentID = @depID
GO
SELECT @@LANGUAGE --BIẾN CỤC BỘ 
SELECT @@VERSION
GO

--các hàm cơ bản
--hàm tính tổng tất cả giá trị các bản ghi trường StandardCost thuộc bảng ProductCostHistory
SELECT SUM(StandardCost) FROM Production.ProductCostHistory
--hàm trung bình của trường StandardCost thuộc bảng ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory
--hàm lấy ra giá trị lớn nhất của trường StandardCost thuộc bảng ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
--hàm lấy ra giá trị nhỏ nhất của trường StandardCost thuộc bảng ProductCostHistory
SELECT MIN(StandardCost) FROM Production.ProductCostHistory
--hàm đếm tổng số bản ghi trong bảng ProductPhoto
SELECT COUNT(*) FROM Production.ProductPhoto
SELECT * FROM  Production.ProductPhoto
--hàm lấy ra ngày giờ hệ thống
SELECT GETDATE()
--HÀM LẤY RA GIỜ HỆ THỐNG
SELECT DATEPART(hh,GETDATE())
--ĐỊNH DẠNG NGÀY DÙNG HÀM CONVERT
SELECT CONVERT(Varchar(50),GETDATE(),103)
/* http://www.java2s.com/Code/SQLServer/Date-Timezone/CONVERTVarChar50GETDATE102.htm
*/
--lấy định dạng cơ sở dữ liệu
SELECT DB_ID('AdventureWorks2019')
--TẠO CƠ SỞ DỮ LIỆU:
CREATE DATABASE SQLQurey8
USE SQLQurey8
CREATE TABLE Contacts 
(MailID varchar(50),
Name NTEXT,
Telephonenumber INT)
ALTER TABLE Contacts ADD Address NVARCHAR (50)

-- THÊM DỮ LIỆU VÀO BẢNH CONTACTS
INSERT INTO Contacts values ('abc@yahoo.com',N'Nguyễn Văn A',8898648,N'Hà Nội')
INSERT INTO Contacts values ('xyz@yahoo.com',N'Phạm Văn B',527386,N'Hồ Chí Minh')
INSERT INTO Contacts values ('dhg@yahoo.com',N'Trần Văn C',537595,N'Nam Định')
INSERT INTO Contacts values ('fdsg@yahoo.com',N'Đinh Thị D',532865,N'Quảng Ninh')
INSERT INTO Contacts values ('fhdg@yahoo.com',N'Nguyễn Thị E',46906,N'Thái Bình')
SELECT * FROM Contacts
--XÓA BẢN GHI CÓ MAIL FHDG@YAHOO.COM
DELETE FROM Contacts WHERE MailID='abc@yahoo.com'
--SỬA BẢN GHI CÓ MAIL FHDG@YAHOO.COM
UPDATE Contacts SET Name=N'Trịnh Hoàng Long' WHERE MailID='fhdg@yahoo.com'
--TẠO LOGIN ACCOUNT ĐỂ TEST  GRANT
CREATE LOGIN SQLQurey8 WITH PASSWORD='12345'
--TẠO USE TỪ  LOGIN ACCOUNT VỪA TẠO
CREATE USE SQLQurey8 FROM LOGIN SQLQurey8

--HỦY BỎ TẤT CẢ CÁC QUYỀN CỦA USE SQLQurey8 TRÊN BẢNG CONTACTS
REVOKE ALL ON Contacts FROM SQLQurey8
--GÁN QUYỀN SELECT TRÊN SQLQurey8 TRÊN BẢNG CONTACTS
 GRANT SELECT ON Contacts TO SQLQurey8