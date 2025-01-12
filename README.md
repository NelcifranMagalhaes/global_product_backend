# Global Products coding test

## Context

Implement a full-stack web or mobile application that can upload, process, and store into a database the following CSV filem which contains a list of products.


## Requirements - Backend

1. The products should be stored along with multiple exchange rates at the time of the upload utilizing this [API](https://github.com/fawazahmed0/exchange-api) (include at least 5 currencies). All product fields are required and must be present.
2. Implement an endpoint that returns all the processed rows of product data along with the available currency conversions stored at the time of the upload. This endpoint should support filtering and sorting based on the name, price, and expiration fields
4. The application should support CSV files with up to 200k rows.

## Technologies
1. Rails 8.0.1
2. Ruby 3.3.6
3. SQLite Database

## Requirements - Frontend
- [Frontend repository](https://github.com/NelcifranMagalhaes/global_product_frontend)
1. The front-end should display a file upload input that allows the user to select a CSV file from their device.
2. While the file is uploading and being processed, there should be a loading indicator displaying progress of the upload.
3. Once the file uploads, a success message should display and you should be able to browse a table of the uploaded products. 

