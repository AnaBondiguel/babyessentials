# R7. Identification of the problem you are trying to solve by building this particular marketplace app.
Kids grow up quickly. Many baby essentials like bassinet and car seat, are still in the a good condition to use after six-months to three years. It would be wasted if parents abandoned them, but those baby products occupy so much spaces at home. Therefore, it will be nice to build a two-sided marketplace to help parents to sell and buy the second-hand baby essentials. Parents can get rid of the baby items when they don’t need them any more without costing them too much money. They also can buy a cheaper second-hand products for what they need now, such as kids' desk, bike etc.

# R8. Why is it a problem that needs solving?
Many parents experienced that they had a lot of baby essentials left in their storage room when their kids grew up. It occupies so much spaces at home. If parents discard them, it’s wasted and not environmental friendly. Also, in a lot cases, parents would buy things before their baby born, such as cot, pram, and sleeping bags etc. However, it might be end up that they haven’t used them at all or only used several times when the products weren’t not right. For example, a friend of mine was a new parent, she bought four strollers for her kid. Some her strollers either are too complicated and hard to use or too heavy and difficult to travel. In this case, I think that if she could sell her stroller and buy the second-hand one online, it would save her money and space at home. Also, she would get a bouns to communicate with other parents to know what stroller is good for her child. In this way, we recycle our baby products in the community and are environmental friendly for sustainability. 

# R9. A link (URL) to your deployed app 
[BabyEssentials_HerokuApp](https://babyessentials.herokuapp.com/)

[BabyEssentials_StagingHeroku](https://staging-babyessentials.herokuapp.com/)

# R10. A link to your GitHub repository (repo).
[BabyEssentials_GithubRepository](https://github.com/AnaBondiguel/babyessentials.git)

# R11. Description of your marketplace app (website), including:
### Purpose
The purpose of this two-sided marketplace application is to help parents to buy and sell baby essentails, such as nursery furniture, prams, and car seats etc. The application connects with parents around our community to their favourite baby products at affordable price. It helps to save spaces at home and money for parents, and to protect our environment for substainability.

### Functionality / Features
1. Two-sided marketplaces for users to sell and buy products by using Ruby on Rails, Postgresql database in development and production, and yarn for package manager for javascript 

2. Using Devise for user authentication

3. User authorisation allows users to have restrictions on what they can see, edit and delete

4. Using Active Storage for uploading images

5. Having AWS S3 Bucket feature to storage my uplodaded images

6. Application deployment on Heroku

7. Using Stripe for a payment system

8. Using Webhook to track customers' payment if the customers loss internet connection after payment and verify the person has truly made a purchase and isn't just faking the data in the URL.

9. Creating a search bar for users to find their items 

10. Having a form to create new listings with the gem of simply_form

11. Using gem of Omniauth-Facebook: users can use their Facebook account to log into the application if they don't want to sign up with the application

12. Applying bootstrap-scss to the application. I used Jumbotron and Navbar for the home page, and Card for viewing the listing page. 

13. Creating Profile page: users can view their profile and what they bought and sold in the past

### Sitemap
![Sitemap_App](assets/images/sitemap.jpg)

### Screenshots
![HomePage](assets/images/homepage.png)
![ProfilePage](assets/images/profile.png)
![BoughtItemPage](assets/images/boughtitem.png)
![SoldItemPage](assets/images/solditem.png)
![ListingsPage](assets/images/listing.png)
![FormPage](assets/images/newlisting.png)
![ItemsPage](assets/images/items.png)
![SearchPage](assets/images/search.png)
![PaymentPage](assets/images/payment.png)
![SuccessPage](assets/images/success.png)
![SignUpPage](assets/images/signup.png)
![SignInPage](assets/images/signin.png)
![PasswordPage](assets/images/forgotpassword.png)

### Target audience
Our target audiences are parents

### Tech stack (e.g. html, css, deployment platform, etc)
I used Heroku to deploy this two-sided marketplace application.

I also used bootstrap-sass, responsive CSS skeleton, application.css, and listing.scss for the style of this application.

I used html.erb in the views to structure the web pages.

I used Postgreql database to create and modify data.

I used Ruby and Rails to build the infrastructure to support the two-sided marketplace application. 

I used AWS S3 Bucket feature to storage my uplodaded images

I used Stripe and webhook for a payment system

I allow users can use their Facebook account to log in my application

# R12. User stories for your app
As mums, my friends and I want to get rid of our baby items because our kids grew up. We don't need our bassinet, baby capsule, baby walk, baby bouncer etc. anymore, but they are still in very good condition (some baby products have never been used or used once). We think other parents who have newborn babies may need these baby items. At the same time, we also would like to purchase toddler or kid essentials from other parents, such as bunk bed, bookshelf, desk, raincoat, bike etc.  and help each other out. We can also recycle those baby/kid items in our community and be environmentally friendly.

We want to have an application to have 1) our accounts to create, edit and delete the listing products, 2) the listings where we can buy and sell the products, 3)the payment function that we can make transaction to puchase the products. 

# R13. Wireframes for your app
Please see the PDF document

# R14. An ERD for your app
![ERDBabyEssentails](/images/ERD.png)

# R15. Explain the different high-level components (abstractions) in your app
My two-sided marketplace application followed a typical Rails application architecture - Model View Controller (MVC). MVC has three main parts: model, view, and controller to serve a specific function and provide modularity.

The model represents and manages the content or data in the application. The model has a responsibility to connect to the database and retrieve and modify the content. By default, only the ApplicationRecord in a Rails application inherits from ActiveRecord::Base. All other models inherit from ApplicationRecord. ApplicationRecord makes the features present only for the models that inherit from it, other models, as well as direct use of Active Record::Base stay pristine, uncluttered by the module feature. In my application, there are models: application_record, category, listing, order, and user. They demonstarte the data struture and relationships and assoications between the entities and are also responsible for doing some validation of the data.

The view is the interface for the application user and is responsible for displaying entities (the model) to the user, and allows the user to interact with the entities. In my application, the html.erb files in the folders - active_storage/blobs, devise, registrations, users/profile, sessions, shared, layouts, listings, orders, and pages allows me to insert ruby code in the views. This is how views can make use of the information passed to them by controllers from the models, and how I can embed logic directly in my web pages.

The controller is the brain or the orchestrator. By default, only the ApplicationController in a Rails application inherits from ActionController::Base. All other controllers inherit from ApplicationController. This gives one class to configure things such as filtering of sensitive request parameters. In my application, I have application_controller, listings_controller, order_controller, pages_controller, profile_controller, and omniauth_callbacks_controller. The controllers interact with the views to get the content from the models in order to display and update the content based on user interaction. The controller executes actions and renders the view. In the controller action, the controller obtains information from the model and provides the information by using instance variables (e.g. @listing) to the view. With the appropriate information, the controller renders the view from the model. The rendered content is sent to the client. By default, the view that it renders is in the views directory and has a name to match the controller action. 

# R16. Detail any third party services that your app will use
### Heroku for application deployment
I used Heroku for application deployment. Firstly, I created my account for Heroku. Secondly, I connected my baby essentials repository to Heroku so that I can git push application for updating my repository as well as the Heroku stage app. Finally, I would promote my stage app to the production. 

### Stripe for payment service
I used Stripe to handle credit card data and redirect the customer's browser after payment is completed. Firstly, I setup Stripe account and got the publishable and secret API keys. Secondly, I bundled Stripe gem and setup the credentials file, and also created a stripe.rb file in config/initializer. Thirdly, I created Stripe session in the listings_controller, so the show action will render the single order and I can add "buy now" button there. The session will store which user is going to buy item for which listing. All this information must be sent in the session and Stripe will connect the created session with our business in our Stripe account. Fourthly, I added the "buy now" button and the stripe string in the views/listings/show.html.erb. I want to render a "but now" button and run an order when button is clicked. This step have been done with Javascript. Fifththly, I created payment success in the orders_controller and views/orders/success.html.erb. Finally, I defined routes for the "payment success" view and ensured the root route that was correct. Then I did check whether the payment with a test credit card was correct or not. 

### Webhook for tracking the purchase
I used Webhook to track customers payment if the customers loss internect connection after payment and verify the person has truly made a purchase and isn't just faking the data in the URL. Firstly, I went to Stripe dashboard and added endpoints (I have two endpoints: one is for localhost and another one is for Heroku), and registered the account in Ultrahook to get the API key. Ultrahook is a gem that provides an internet reachable URL from our computer that then forwards the request on to our localhost. Secondly, I installed the gem for Ultrahook and run ultrahook in my terminal (ultrahook stripe 3000), then copied and pasted the URL into the endpoint in the Stripe dashboard. Thridly, I added the Webhook route in the route.rb. Fourthly, I added the Webhook action in the orders controller. Finally, I needed to create Webhook in my app on Heroku with my URL that I created for the endpoint in Stripe/Webhook. 

### Facebook for application login feature
I followed the documentation [OmniAuth_Facebook](https://github.com/heartcombo/devise/wiki/OmniAuth:-Overview) to set gems and code on my VS code. I got App ID and App scret from the developer Facebook and added them into my config/initializers/devise.rb. In addition, I created a omniauth_callbacks_controller and make my model (user.rb) omniaythable. Moreover, I went to the route.rb and added route for Omniauth and added Facebook authentication into my _nav.html.erb. Then I implemented the callback as an action for Facebook provider in the omniauth_callbacks_controller. Furthermore, I implemented the from_omniauth method in my model (user.rb). This method tries to find an existing user by the provider and uid fields. If no user is found, a new one is created with a random password and some extra information. I also implemented new_with_session in my model to copy the Facebook email if available. This is because Devise's RegistrationsController by default calls User.new_with_session before building a resource. This means that, we need to copy data from session whenever a user is initialized before sign up. Finally, the most important thing is to ensure that I got all URLs of my app (localhost and Heroku) in the valid OAuth redirect URIs that is located in my Facebook developer - client OAuth settings.

### AWS S3 Bucket feature to storage my uplodaded images
I used AWS S3 Bucket to storage my uploaded images. Firstly, I created an account with AWS and went to S3 to create a bucket. Then I went to Iam to add and create user to get my access key ID and secret access key. I put those keys into my credential.yml. Secondly, I bundled add aws-sdk-s3, and then went to config/storage.yml file to eidt the settings that are related to Amazon. Thirdly, I needed to go to environments/development.rb and production.rb to change config.active_storage.service from local to amazon. Finally, I could go back to my app and create some new listings with attached images. When I refreshed the page of AWS S3 bucket, I could see the image files inside of my bucket. One thing I needed to pay attention is to ensure the pictures are not in JPEG format (I used jpg format). Otherwise, I would get errors when I deployed my app on Heroku. 

# R17. Describe your projects models in terms of the relationships (active record associations) they have with each other
1. A user account has none or many orders for the listing items (people may hold an account but not have to buy or sell anything). However, an order has to have a user_id (people can buy or sell without a user account). The relationships are associated through ‘user_id’ on the Users table and creating ‘buyer_id’ and ‘seller_id’ through other tables. 

2. A user account may have none or many listings, but a listing must have one user_id. The relationships are associated through ‘user_id’ on the Users table.

3. An order has to have one listing (people won’t buy or sell without listing items), but listings can only have none or one order (can’t have many orders for one listing item). The relationships are associated through ‘listing_id’ on the Listings table.

4. An listing belongs to none or one category such as car seats, prams, and nursery furniture and decor. However, a category has none or many listings. The relationships are associated through ‘category_id’ on the Categories table.

5. A Facebook account can only be used by one user, and a user can have none or one Facebook account to register into the account of application (Users don't need to have a Facebook account to register in the application). The relationships are associated through ‘Facebook_id’ on the Facebook table.

6. A payment has to have an order (users can't pay without an order), and an order has to have a payment (users can't order items without payment). The relationships are associated through ‘payment_id’ on the payments table.

7. Every listing has to have one active storage attachment (e.g. if users didn't attach an image, they will get a default image for their listing), but active storage attachment must have one or many listings. The relationships are associated through ‘attachment_id’ on the active storage attachments table.

8. Every listing has none or only one action text rich text (e.g. users don't need to write the description of their item), but action text rich text must have one or many listings. The relationships are associated through ‘rich_text_id’ on the action text rich texts table.

9. One active storage attachment has to have one active storage blob, but one active storage blob must have one or many active storage attachments. The relationships are associated through ‘blob_id’ on the active storage blobs table.

10. One active variant record has to have one active storage blob, but one active storage blob must have one or many active storage variant records. The relationships are associated through ‘blob_id’ on the active storage bolbs table.

# R18. Discuss the database relations to be implemented in your application
Entities and attributes
1. Listings: title, description, condition, price, sold, user_id, category_id, listing_id
2. Users: email, username, password, user_id
3. Orders: listing_id, buyer_id, seller_id, order_id
4. Categories: name, category_id
5. Facebook: username, facebook_id
6. Payments: title, price, payment_id
7. Active_Storage_Attachments: name, record_type, record_id, blobs_id, create_at, attachment_id
8. Action_Text_Rich_Texts: name, text, record_type, record_id, create_at, update_at, rich_text_id
9. Active_Storage_Blobs: key, filename, content_type, metadata, service_name, bytez_size, checksum, created_at, blob_id
10. Active_Storage_Variant_Records: blob_id, variation_digest, variant_record_id


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
•	An order has one payment

The relationship between listings and active storge attachments
•	A listing has one active storage attachment
•	An active storage attachment has many listings

The relationship between listings and action text rich texts
•	A listing has one or none action text rich text
•	An action text rich text has many listings

The relationship between active storage blobs and active storge attachments
•	An active storage attachment has one active storage blob
•	An active storage blob has many active storge attachments

The relationship between active storage blobs and active storage variant records
•	An active storage variant record has one active storage blob
•	An active storage blob has many active storge variant records

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
![ERDBabyEssentails](assets/images/ERD.png)

# R20. Describe the way tasks are allocated and tracked in your project
I used Trello to track and allocate my tasks in my project. I put them into small tasks and built a card for each of them. I labelled them into different colours for three different types of tasks: Tasks before application development, important tasks, and Readme documentation. I set up checklist for each Trello card and also the timeframe for each task. I put my cards into three stages: planning, doing, and done. Each task was moved from planning, to doing, and then done stages. 

Please see the details what I have done for my project in my Trello cards.
[BabyEssentials_Trello](https://trello.com/b/shJmPj7B/two-sided-market-place-baby-essentails)

Screenshot of my Trello
![TrelloBabyEssentails](assets/images/Trello.png)


