-- Creamos la tabla credit_card
ALTER TABLE transaction ADD INDEX(credit_card_id);
    CREATE TABLE IF NOT EXISTS credit_card (
        id VARCHAR(15) PRIMARY KEY REFERENCES transaction(credit_card_id),
        iban VARCHAR(255),
        pan VARCHAR(255),
        pin VARCHAR(4),
        cvv VARCHAR(3),
        expiring_date VARCHAR(100),
		foreign key(id) REFERENCES transaction(credit_card_id)
    );
    ALTER table transaction DROP FOREIGN KEY `credit_card_id`;
    
    drop table credit_card;