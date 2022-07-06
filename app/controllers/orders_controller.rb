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

    if  params[:type] == "checkout.session.completed"
      # puts "if statement"
           #getting listing id
      payment_id = params[:data][:object][:payment_intent]
      payment = Stripe::PaymentIntent.retrieve(payment_id)
      listing_id = payment.metadata.listing_id
      
       @listing = Listing.find(listing_id)
      #  puts "#{@listing.id}"
      #  puts "#{@listing.sold}"
       @listing.update(sold: true)
      #  puts "#{@listing.sold}"
    #   Order.create(
    #     listing_id: listing_id,
    #     puts "#{@listing.id}"
    #     seller_id: @listing.user_id,
    #     puts "#{@listing.user_id}"
    #     buyer_id: current_user.id
        
    #   )

    # end
    end
    

   end
end

 


  
