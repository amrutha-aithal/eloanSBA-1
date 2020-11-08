DROP DATABASE IF EXISTS loanMgt;

CREATE DATABASE loanMgt;

USE loanMgt;

CREATE TABLE user(
	username varchar(50) NOT NULL,
	password varchar(15) NOT NULL
);

INSERT INTO user VALUES
	('admin','admin');

CREATE TABLE loanInfo(
  applno INT PRIMARY KEY AUTO_INCREMENT,
  purpose VARCHAR(20) NOT NULL,
  amtRequested DECIMAL(10,2) NOT NULL,
  doa DATE NOT NULL,
  bstructure VARCHAR(20) NOT NULL,
  bindicator VARCHAR(20) NOT NULL,
  tindicator VARCHAR(20) NOT NULL,
  address VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile CHAR(10) NOT NULL UNIQUE,
  status VARCHAR(20) NOT NULL  
);

ALTER TABLE loanInfo
AUTO_INCREMENT=1000;

INSERT INTO loanInfo (purpose,amtRequested,doa,bstructure,bindicator,tindicator,address,email,mobile,status) VALUES
 ('MORTGAGE','800000.00','2020-11-04','Individual','Salaried','Tax Payer','St-Johns Rd Bangalore','abc@gmail.com','9964942244','APPLIED'),
 ('MORTGAGE','850000.50','2020-11-05','Individual','Salaried','Tax Payer','Hobli Bangalore','xyz@gmail.com','9915489633','PENDING'),
 ('MORTGAGE','900000.00','2020-11-06','Individual','Salaried','Tax Payer','Bellandur Bangalore','pqr@gmail.com','9986457111','APPROVED'),
 ('MORTGAGE','1000000.00','2020-11-07','Individual','Salaried','Tax Payer','101 AES Layout Bangalore','abc1@gmail.com','9974586411','PENDING'),
 ('MORTGAGE','950000.25','2020-11-03','Individual','Salaried','Tax Payer','29,RT Nagar Bangalore','ab123@gmail.com','8896415254','REJECTED');
 
 
 CREATE TABLE approvedLoan(
  applno INT REFERENCES loanInfo,
  amotsanctioned DECIMAL(10,2) NOT NULL,
  loanterm DECIMAL(10,2) NOT NULL,
  psd DATE NOT NULL,
  lcd DATE NOT NULL,
  emi DECIMAL(10,2) NOT NULL  
 ); 
 
 INSERT INTO approvedLoan VALUES
 	('1002','800000.00','5.00','2020-12-01','2024-12-01','14500.00');
 
 commit;