class Api::V1::RestaurantsController < ApplicationController
  # respond_to :json
  # before_action :set_restaurants, only:[:create ,:show, :edit, :destroy]


  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      puts "success!"
      render jason: @restaurant
    else
      puts "Sorry something went wrong"
    end

  end


private
  def restaurant_params
    params.require(:restaurant).permit(:name,:address)
  end


end
