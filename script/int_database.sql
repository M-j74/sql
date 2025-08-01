use master;

--create a new database 
create database datawarehouse;
------ how to coonect with new database

use datawarehouse;

## to check if data base exist already
  if exist (select 1 from sys.database where name = 'datawarehouse')
  ## if found then drop it and create new one
  
----create schemma it's like a folder where we keep material
  
create schema bronze;
go ----it,s like seperator who tell the sql to complete first one command and then move next
create schema silver;
go
create schema gold;
