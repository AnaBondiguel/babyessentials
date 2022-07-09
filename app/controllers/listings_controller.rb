class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy place_order ]
  before_action :set_form_vars, only: %i[ new edit ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end
# Create a search bar for webpages
  def search
    @listings = Listing.where("title LIKE ?","%" + params[:q] + "%")
  end

  # GET /listings/1 or /listings/1.json
  #create a Stripe session to store which user is going to buy for which item 
  #all the information is sent in the session and Stripe will connect the session with the business in my strip account
  def show

    if current_user
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @listing.title,
        images: [url_for(@listing.picture)],
        amount: (@listing.price * 100).to_i,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: { 
          listing_id: @listing.id,
          buyer_id: current_user.id,
        }
      },
      success_url: "#{root_url}/orders/success?listingId=#{@listing.id}",
      cancel_url: "#{root_url}/listings"
    )
    @session_id = session.id
 
    end


       # @listings = Listing.all
    # # current_index = @listings.find_index(@listing)
    # listings_array = @listings.to_ary()
    # prev_index = nil
    # next_index = nil
    # current_index = nil

    # listings_array.each_with_index |index, listing| do
    #   if listing.id == @listing.id then
    #     current_index = index
    #   end
    # end

    # if current_index == nil then
    #   # 404
    # end
    
    # if current_index > 1 then
    #   prev_index = current_index - 1
    #   @prev_link = @listings[prev_index]
    # end

    # if current_index < listings_array.length - 1 then
    #   next_index = current_index + 1
    #   @next_link = @listings[next_index]
    # end
  end
 
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    
    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # def place_order
  #   Order.create(
  #     listing_id: @listing.id,
  #     seller_id: @listing.user_id,
  #     buyer_id: current_user.id
  #   )
  #   @listing.update(sold: true)
  #   redirect_to orders_success_path
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end
    # Set some form variables: create variable at categories so I can use it in the listings
    def set_form_vars
      @categories = Category.all
      @conditions = Listing.conditions.keys
      
    end
 
    # Authorizing users: checking if the user who own the listing is the current logined user
    def authorize_user
      if @listing.user_id != current_user.id
        flash[:alert] = "You can't do that!"
        redirect_to listings_path
      end
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :condition, :price, :sold, :user_id, :category_id, :picture, :search)
    end
end
