class Api::V1::RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # respond_to :json
  # before_action :set_restaurants, only:[:create ,:show, :edit, :destroy]


  def create
    @restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save  
      render json: @restaurant
    else
      render json:{ :errors => @restaurant.errors.full_messages }
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update
      render json: {
        message: "This quote has been updated successfully."
        }
    else
      render json:{ :errors => @restaurant.errors.full_messages }
    end
  end

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  end

private
  def restaurant_params
    params.require(:restaurant).permit(:name,:address)
  end


end
