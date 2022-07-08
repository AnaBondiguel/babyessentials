class Users::ProfileController < ApplicationController
    before_action :authenticate_user!

    def index
        @current_user = current_user
        # @bought_items = current_user.bought_orders
        # @sold_items = current_user.sold_orders
    end
end