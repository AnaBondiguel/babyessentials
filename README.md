# R7. Identification of the problem you are trying to solve by building this particular marketplace app.
I’d like to build a two-sided market for helping parents to sell and buy the second-hand baby essentials. Kids grow up quickly. Many baby essentials like bassinet and car seat, are still quite new after six-months to three years. Parents can get rid of the baby items when they don’t need them any more without losing too much money. They also can buy a cheaper second-hand products for what they need now.

# R8. Why is it a problem that needs solving?
Many parents experienced that they had a lot of baby essentials left in their storage room when their kids grew up. It occupies so much spaces at home. If parents discard themw, it’s wasted and not environmental friendly. Also, some parents would buy things before their baby born, such as cot, pram, and sleeping bags etc. However, it might be end up that they haven’t used them at all or only used several times or the products weren’t not right, they need to buy another type for the replacement. In order to save environment and parents money, I’d like to build a two-market place for parents to buy and sell their baby essentials. 

# R9. A link (URL) to your deployed app (i.e. website)
[BabyEssentials_HerokuApp](https://babyessentials.herokuapp.com/)

# R10. A link to your GitHub repository (repo).
[BabyEssentials_GithubRepository](git@github.com:AnaBondiguel/babyessentials.git)

# R11. Description of your marketplace app (website), including:
### Purpose
The purpose of this two-sided marketplace application is to help parents to buy and sell baby essentails, such as nursery furniture, prams, and car seats etc. The application connects with parents around our community to their favourite baby products at affordable price. It helps to save spaces at home and money for parents, and to protect our environment for substainability.

### Functionality / features
1. Two-sided marketplaces for users to sell and buy products by using Ruby on Rails, Postgresql database in development and production, and yarn for package manager for javascript 

2. Using Devise for user authentication

3. User authorisation allows users to have restrictions on what they can see and edit

4. Using Active Storage for uploading images

5. Application deployment on Heroku

6. Using Stripe for a payment system

7. Creating a search bar for users to find their items 

8. Having a form to create new listings with the gem of simply_form

9. Users can use their Facebook account to log into the account of the application with the gem of Omniauth-Facebook

10. I applied bootstrap-scss: card into my view of the listings. Users can have better experiences to view the products online.

11. Users can view what they bought and sold in the past in the links of bought items and sold items.

12. Using Webhook to track customers' payment if the customers loss internet connection after payment and verify the person has truly made a purchase and isn't just faking the data in the URL.


### Sitemap
![Sitemap_App](sitemap.jpg)

### Screenshots
![Homepage](Homepage.png)
![Listingspage](Listings.png)
![Formpage](form.png)
![Itempage](item.png)
![Paymentpage](payment.png)
![Successpage](success.png)
![Searchpage](search.png)
![Signuppage](signup.png)
![Signinpage](signin.png)
![Signinpage](forgotpassword.png)

### Target audience
Our target audiences are parents

### Tech stack (e.g. html, css, deployment platform, etc)
I used Heroku to deploy this two-sided marketplace application.

I also used bootstrap-sass, responsive CSS skeleton, application.css, and listing.scss for the style of this application.

I used html.erb in the views to structure the web pages.

I used Postgreql database to create and modify data.

I used Ruby and Rails to build the infrastructure to support to support the two-sided marketplace application. 

# R12. User stories for your app
As mums, my friends and I want to get rid of our baby items because our kids grew up. We don't need our bassinet, baby capsule, baby walk, baby bouncer etc. anymore, but they are still in very good condition (some baby products have never been used or used once). We think other parents who have newborn babies may need these baby items. At the same time, we also would like to purchase toddler or kid essentials from other parents, such as bunk bed, bookshelf, desk, raincoat, bike etc.  and help each other out. We can also recycle those baby/kid items in our community and be environmentally friendly.

# R13. Wireframes for your app

# R14. An ERD for your app
![ERDBabyEssentails](ERD.jpg)

# R15. Explain the different high-level components (abstractions) in your app
My two-sided marketplace application followed a typical Rails application architecture - Model View Controller (MVC). MVC has three main parts: model, view, and controller to serve a specific function and provide modularity.

The model represents and manages the content or data in the application. The model has a responsibility to connect to the database and retrieve and modify the content. By default, only the ApplicationRecord in a Rails application inherits from ActiveRecord::Base. All other models inherit from ApplicationRecord. ApplicationRecord makes the features present only for the models that inherit from it, other models, as well as direct use of Active Record::Base stay pristine, uncluttered by the module feature. In my application, there are models: application_record, category, listing, order, and user. They demonstarte the data struture and relationships and assoications between the entities and are also responsible for doing some validation of the data.

The view is the interface for the application user and is responsible for displaying entities (the model) to the user, and allows the user to interact with the entities. In my application, the html.erb files in the folders - devise, registrations, sessions, shared, layouts, listings, orders, and pages allows me to insert ruby code in the views. This is how views can make use of the information passed to them by controllers from the models, and how I can embed logic directly in my web pages.

The controller is the brain or the orchestrator. By default, only the ApplicationController in a Rails application inherits from ActionController::Base. All other controllers inherit from ApplicationController. This gives one class to configure things such as filtering of sensitive request parameters. In my application, I have application_controller, listings_controller, order_controller, pages_controller and omniauth_callbacks_controller. The controllers interact with the views to get the content from the models in order to display and update the content based on user interaction. The controller executes actions and renders the view. In the controller action, the controller obtains information from the model and provides the information by using instance variables (e.g. @listing) to the view. With the appropriate information, the controller renders the view from the model. The rendered content is sent to the client. By default, the view that it renders is in the views directory and has a name to match the controller action. 

# R16. Detail any third party services that your app will use
### Heroku for application deployment
I used Heroku for application deployment. Firstly, I created my account for Heroku. Secondly, I connected my baby essentials repository to Heroku so that I can git push application for updating my repository as well as the Heroku stage app. Finally, I would promote my stage app to the production. 

### Stripe for payment service
I used Stripe to handle credit card data and redirect the customer's browser after payment is completed. Firstly, I setup Stripe account and got the API keys. Secondly, I bundled Stripe gem and setup the credentials file, and also created a Stripe.rb file in config/initializer. Thirdly, I created Stripe session in the listings_controller and added the "buy" button and the Stripe string in the views/listings/show.html.erb. Fourthly, I created payment success in the orders_controller and views/orders/success.html.erb. Finally, I defined routes for the "payment success" view and ensured the root route that was correct. Then I did check whether the payment with a test credit card was correct or not. 

### Webhook for tracking the purchase
I used Webhook to track customers payment if the customers loss internect connection after payment and verify the person has truly made a purchase and isn't just faking the data in the URL. Firstly, I went to Stripe dashboard and added endpoint, and registered the account in Ultrahook to get the API key. Secondly, I installed gem for Ultrahook and run ultrahook in my terminal (ultrahook stripe 3000), then copied and pasted the URL into the endpoint in the Stripe dashboard. Thridly, I added the Webhook route in route.rb. Finally, I added the Webhook action in the orders controller.

### Facebook for application login feature
I followed the documentation [https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview) to set gems and code on my VS code. I got App ID and App scret from the developer Facebook. 

# R17. Describe your projects models in terms of the relationships (active record associations) they have with each other
1. A user account has none or many orders for the listing items (people may hold an account but not have to buy or sell anything). However, an order has to have a user_id (people can buy or sell without a user account). The relationships are associated through ‘user_id’ on the Users table and creating ‘buyer_id’ and ‘seller_id’ through other tables. 

2. A user account may have none or many listings, but a listing must have one user_id. The relationships are associated through ‘user_id’ on the Users table.

3. An order has to have one listing (people won’t buy or sell without listing items), but listings can only have none or one order (can’t have many orders for one listing item). The relationships are associated through ‘listing_id’ on the Listings table.

4. An listing belongs to none or one category such as car seats, prams, and nursery furniture and decor. However, a category has none or many listings. The relationships are associated through ‘category_id’ on the Categories table.

5. A Facebook account can only be used by one user, and a user can have none or one Facebook account to register into the account of application (Users don't need to have a Facebook account to register in the application). The relationships are associated through ‘Facebook_id’ on the Facebook table.

6. A payment has to have an order (users can't pay without an order), and an order has to have a payment (users can't order items without payment). The relationships are associated through ‘payment_id’ on the payments table.

# R18. Discuss the database relations to be implemented in your application
Entities and attributes
1. Listings: title, description, condition, price, sold, user_id, category_id
2. Users: email, username, password
3. Orders: listing_id, buyer_id, seller_id
4. Categories: name
5. Facebook: username
6. Payments: title, price

The relationship between users and orders
•	A user has none or many orders
•	An order has to have one user

The relationship between users and listings
•	A user may have none or many listings
•	A listing must have one user

The relationship between listings and orders
•	An order has to have one listing
•	Listings can only have none or one order

The relationship between listings and categories 
•	An listing belongs to none or one category
•	A category has none or many listings

The relationship between Facebook and users
•	An Facebook account has one user
•	A user has none or one Facebook account

The relationship between payments and orders
•	A payment has one order
•	A order has one payment

Users model
has_many :listings
has_many :sold_orders, foreign_key: “seller_id”, class_name: “Order”
has_many :bought_orders, foreign_key: “buyer_id”, class_name: “Order”
devise :omniauthable, omniauth_providers: %i (facebook)

Orders model
belongs_to :listing
belongs_to :buyer, foreign_key: “buyer_id”, class_name: “User”
belongs_to :seller, foreign_key: “seller_id”, class_name: “User”

Listings model
belongs_to :user
belongs_to :category

# R19. Provide your database schema design
![ERDBabyEssentails](ERD.jpg)

# R20. Describe the way tasks are allocated and tracked in your project