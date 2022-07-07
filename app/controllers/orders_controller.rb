class OrdersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: [:webhook]
  skip_before_action :authenticate_user!, only: [:webhook]

  def success

  end

  def bought
    @bought_items = current_user.bought_orders
  end

  def sold
    @sold_items = current_user.sold_orders
  end

  def webhook
    #  puts "webhook running" 
#if statement for webhook completed checkout session, then it should get listing_it for sold item, get listing sold updated.
    if  params[:type] == "checkout.session.completed" 
      # puts "if statement"
#getting listing id
      payment_id = params[:data][:object][:payment_intent]
      payment = Stripe::PaymentIntent.retrieve(payment_id)
      listing_id = payment.metadata.listing_id
#finding the sold item listing_id from database
       @listing = Listing.find(listing_id)
      #  puts "#{@listing.id}"
      #  puts "#{@listing.sold}"
       @listing.update(sold: true)
        # puts "#{@listing.sold}"
#updating the bought and sold listings with the information about sold items
     @order = Order.create(
        listing_id: @listing.id,
        seller_id: @listing.user_id,
        buyer_id: current_user.id
      )
      # puts "order create!!!"
      # puts "#{@order.seller_id}"
      # Below the @order code, the messages from puts are not printed. However, the puts statement above prints msg. This means that @order does nothing.
      # redirect_to orders_success_path
    end
   end
end

 


  
