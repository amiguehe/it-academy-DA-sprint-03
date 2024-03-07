#ex1
ALTER TABLE transaction ADD INDEX(credit_card_id);

#ex2
select * from credit_card
where id="CcU-2938";
update credit_card
set IBAN = "TR323456312213576817699999"
where id ="CcU-2938";

#ex 3
SET FOREIGN_KEY_CHECKS=0;
insert into transaction (Id, credit_card_id, company_id, user_id, lat, longitude, amount, declined)
values ("108B1D1D-5B23-A76C-55EF-C568E49A99DD", "CcU-9999", "b-9999", "9999", "829.999", "-117.999", "111.11", "0");

select * from transaction
where credit_card_id ="CcU-9999";

#ex4
select * from credit_card;
alter table credit_card
drop pan;


#ex 2.1
select * from transaction
where id = "02C6201E-D90A-1859-B4EE-88D2986D3B02";
delete from transaction
where id = "02C6201E-D90A-1859-B4EE-88D2986D3B02";

#ex2.2
select * from credit_card
where id ="CcU-2938";
update credit_card
set IBAN = " R323456312213576817699999"
where id ="CcU-2938";

#ex2.3
CREATE VIEW VistaMarketing AS
SELECT
    company.company_name as company,
    company.phone as phone,
    company.country as country,
    avg(transaction.amount) as avg_total
FROM
    company
INNER JOIN transaction on company.id = company_id
INNER JOIN credit_card on transaction.credit_card_id = credit_card.id
inner join user on company.country = user.country
GROUP BY company, phone, country
order by avg_total desc;

SELECT
    company.company_name as company,
    company.phone as phone,
    company.country as country,
    avg(transaction.amount) as avg_total
FROM
    company
INNER JOIN transaction on company.id = company_id
INNER JOIN credit_card on transaction.credit_card_id = credit_card.id
inner join user on company.country = user.country
GROUP BY company, phone, country
order by avg_total desc;


#ex 3.1
	#>6 cambios
		
	#0 drop pan (ej 4) - DONE - check ex4

select * from company;
	#1 drop company.website (done)
alter table company
drop column website;

	#2 cambiar user.email por user.personal_email (done)
ALTER TABLE user RENAME COLUMN email TO personal_email;

	#3 cvv from varchar to INT (done)
Alter table credit_card modify column cvv INT;

	#4 add fecha_actual DATE (done)
alter table credit_card add column fecha_actual date;
    
    #5 cambiar credit_card.id varchar (15) a varchar (20)
alter table credit_card modify column id varchar(20);

	#6 cambian IBAN varchar (255) a varchar (50)
alter table credit_card modify column IBAN varchar (50);

	#7 cambiar credit_card.expiring_date varchar (100) a varchar(10)
alter table credit_card modify column expiring_date varchar(10);


#ex 3.2
CREATE VIEW InformeTecnico AS
SELECT
    credit_card.id as card_id,
    transaction.id as transaction_id,
    name as first_name,
    surname as surname,
    user.personal_email as email,
    user.country as country,
    credit_card.Iban as Iban_number,
    company.company_name as company,
    company.country as company_country,
    transaction.amount as total
FROM
    company
INNER JOIN transaction on company.id = company_id
INNER JOIN credit_card on transaction.credit_card_id = credit_card.id
inner join user on transaction.user_id = user.id
GROUP BY card_id, transaction_id, first_name, surname, email, country, Iban_number, company, company_country, total
order by transaction_id desc;

SELECT
    credit_card.id as card_id,
    transaction.id as transaction_id,
    name as first_name,
    surname as surname,
    personal_email as email,
    user.country as country,
    credit_card.Iban as Iban_number,
    company.company_name as company,
    company.country as company_country,
    transaction.amount as total
FROM
    company
INNER JOIN transaction on company.id = company_id
INNER JOIN credit_card on transaction.credit_card_id = credit_card.id
inner join user on transaction.user_id = user.id
GROUP BY card_id, transaction_id, first_name, surname, email, country, Iban_number, company, company_country, total
order by transaction_id desc;

select * from vistamarketing;
select * from informetecnico;




