# myCart
 A shopping WebApp made using Java, Servlet, JSP, Hibernate, MySQL, HTML, CSS, BootStrap, JavaScript.
## Tools and Tips
 * Create a database named myCart(Required)
 * Server I have used Apache Tomcat server(v 9.0.75)
 * Try to use Eclipse IDE
 * I have given .war file
 * Photos and .war files are uploaded in main directory or parallel to pom.xml
 * To make a user admin you have to from MySQL database

## Features
 * Register :- Fill your basic details and register. If you already have an account then login. If you alreday registered and try to register again then a popup message come saying that "This email-id alredy exist". Here double password checking is enabled.
   ![registration](https://github.com/riteshrhkr/myCart/assets/137643945/d60e60e3-a6f0-435d-8981-c1d56bbc9988)

  
 * Login  :- If you are an admin then it will automaticly redirect to admin page. And if you are a normal user then you will be redirected to home page. If you enter worng email-id or password then a popup message come saying that "Invalid email-id or password!"
![logout](https://github.com/riteshrhkr/myCart/assets/137643945/f710ad9a-37fd-4a84-91ae-4c5f81693f43)


 * Forget password  :- You have also feature to retrive you account by changing password. 

 
 * Home page :- A list of product will we show. You can filter products according to their category. A card represent a product and each card have a product photo, Title, Descreption, add to card button and price of the product with origional price and discount.
![homePage](https://github.com/riteshrhkr/myCart/assets/137643945/1804185c-bdcc-43f4-9dd3-e14cdca374c4)

 
 * Your Cart  :- The product you have added in your cart. You can delete product or checkout. In your cart a table will be show that have name, price, quantity, total price and after the table end Total price you need to pay will show. If you don't have any product then checkout button will disable.
![cart](https://github.com/riteshrhkr/myCart/assets/137643945/bfa98ff0-361c-4b11-ac9a-81633e5d2de1)

 
 * Order :- your cart will be shown in a side and in other side you your details comes from database. you have to check you details and fill pincode. This form have two buttons order and buy more. Order button will order your selected items and delete all products from cart and redirect to home page. second buy more will redirect to home page.
   ![order](https://github.com/riteshrhkr/myCart/assets/137643945/ffbced6d-dce9-4e54-b5d5-b662e4c7dfa8)

 
 * Admin Page :- Here you can see the total no. of user, no. of categories, no. of products, you can add categories and products. User have some features like make an user admin, block a user, etc. categories and product will just show total no.
![admin](https://github.com/riteshrhkr/myCart/assets/137643945/20f6102d-73f6-4a90-8d66-a8f65536a184)

 
 * Add Category  :-  Add a new category to the database. When you careate a new category then a new directory also created with the same name in img/products/ directory.
 * Add product  :- fill form and add a new product. The image you select will add to the category directory that you have selected and created while creating a category.
   ![addProduct](https://github.com/riteshrhkr/myCart/assets/137643945/b8de452b-f3f7-4365-8774-0dfc0cb64213)

