CREATE TABLE customer (CUSTOMERID BIGINT AUTO_INCREMENT NOT NULL, CUSTOMEREMAIL VARCHAR(255) UNIQUE, CUSTOMERNAME VARCHAR(255), DATEOFBIRTH DATE, DISABLED TINYINT(1) default 0, USERNAME VARCHAR(255), PRIMARY KEY (CUSTOMERID))
CREATE TABLE security_user (USERNAME VARCHAR(255) NOT NULL, DISABLED TINYINT(1) default 0, PASSWORD VARCHAR(255), PRIMARY KEY (USERNAME))
CREATE TABLE cheque (BILLID BIGINT AUTO_INCREMENT NOT NULL, BILLAMOUNT DOUBLE, BILLGENERATEDDATE DATE, BILLSTATUS varchar(10) default 'ACTIVE', TRANSACTIONID BIGINT UNIQUE, CUSTOMER_ID BIGINT, MANAGER_ID BIGINT, PRIMARY KEY (BILLID))
CREATE TABLE lineitem (ORDERID BIGINT AUTO_INCREMENT NOT NULL, ORDERAMOUNT DOUBLE, ORDERDATE DATE, QUANTITY INTEGER, STATUS varchar(20) default 'UNBILLED', TABLENO VARCHAR(255), TRANSID BIGINT, CUST_ID BIGINT, ITEM_ID BIGINT, ITEM_NAME VARCHAR(255), PRIMARY KEY (ORDERID))
CREATE TABLE manager (MANAGERID BIGINT AUTO_INCREMENT NOT NULL, DATEOFBIRTH DATE, DISABLED TINYINT(1) default 0, MANAGEREMAIL VARCHAR(255) UNIQUE, MANAGERNAME VARCHAR(255), USERNAME VARCHAR(255), PRIMARY KEY (MANAGERID))
CREATE TABLE menuitem (ITEMID BIGINT AUTO_INCREMENT NOT NULL, CATEGORY VARCHAR(255), COST DOUBLE, DATEADDED DATE, ITEMNAME VARCHAR(255) UNIQUE, QUANTITY INTEGER, PRIMARY KEY (ITEMID))
CREATE TABLE security_group (GROUPNAME VARCHAR(255) NOT NULL, GROUPDESCRIPTION VARCHAR(255), PRIMARY KEY (GROUPNAME))
CREATE TABLE sec_user_groups (USERNAME VARCHAR(255) NOT NULL, GROUPNAME VARCHAR(255) NOT NULL, PRIMARY KEY (USERNAME, GROUPNAME))
ALTER TABLE customer ADD CONSTRAINT FK_customer_USERNAME FOREIGN KEY (USERNAME) REFERENCES security_user (USERNAME)
ALTER TABLE cheque ADD CONSTRAINT FK_cheque_MANAGER_ID FOREIGN KEY (MANAGER_ID) REFERENCES manager (MANAGERID)
ALTER TABLE cheque ADD CONSTRAINT FK_cheque_CUSTOMER_ID FOREIGN KEY (CUSTOMER_ID) REFERENCES customer (CUSTOMERID)
ALTER TABLE lineitem ADD CONSTRAINT FK_lineitem_ITEM_ID FOREIGN KEY (ITEM_ID) REFERENCES menuitem (ITEMID)
ALTER TABLE lineitem ADD CONSTRAINT FK_lineitem_CUST_ID FOREIGN KEY (CUST_ID) REFERENCES customer (CUSTOMERID)
ALTER TABLE manager ADD CONSTRAINT FK_manager_USERNAME FOREIGN KEY (USERNAME) REFERENCES security_user (USERNAME)
ALTER TABLE sec_user_groups ADD CONSTRAINT FK_sec_user_groups_USERNAME FOREIGN KEY (USERNAME) REFERENCES security_user (USERNAME)
ALTER TABLE sec_user_groups ADD CONSTRAINT FK_sec_user_groups_GROUPNAME FOREIGN KEY (GROUPNAME) REFERENCES security_group (GROUPNAME)
