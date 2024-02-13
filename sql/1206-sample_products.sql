CREATE TABLE SAMPLE_PRODUCTS (
    PROD_NO             NUMBER(4) PRIMARY KEY,
    PROD_NAME           VARCHAR(255) NOT NULL,
    PROD_MAKER          VARCHAR(255),
    PROD_PRICE          NUMBER(7, 0),
    PROD_DISCOUNT_PRICE  NUMBER(7, 0),
    PROD_STOCK          NUMBER(3, 0),
    PROD_SOLD_OUT       CHAR(1) DEFAULT 'N',
    PROD_CREATED_DATE   DATE DEFAULT SYSDATE,
    PROD_UPDATED_DATE   DATE DEFAULT SYSDATE
);

