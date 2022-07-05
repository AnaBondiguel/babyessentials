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
    payment_id = params[:data][:object][:payment_intent]
    if p params[:type] == "checkout.session.completed"
      @listing = Listing.find(params[:id])
      @listing.update(sold: true)
      redirect_to orders_success_path
    end

    payment = Stripe::PaymentIntent.retrieve(payment_id)
    listing_id = payment.metadata.listing_id
    # user_id = payment.metadata.user_id
     p "Listing id" + listing_id
    #p "user id" + user_id
     render plain: "Success"
  end
end

  #  def place_order
  #    Order.create(
  #      listing_id: @listing.id,
  #      seller_id: @listing.user_id,
  #      buyer_id: current_user.id
  #    )
  #  @listing.update(sold: true)
  #  redirect_to orders_success_path
  #  end
    #  <%= button_to "Buy me!", place_order_path %> 

  
