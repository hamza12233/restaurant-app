class Api::V1::DishesController < ApplicationController
  skip_before_action :verify_authenticity_token


  def create
    @restaurant = Restaurant.find(params[:id])
    @dish = @restaurant.dishes.new(dish_params)
    if @dish.save
      render json: @dish
    else
      render json: { :errors => @dish.errors.full_messages }
    end
  end




  def index
    @dishes = Dish.all
    render json:@dishes
  end

  def show
    @dish = Dish.find(params[:id])
    # @result = @dish.restaurant.name
    render json:{ :restaurant_dish => @dish}
  end






  private
  def dish_params
    params.require(:dish).permit(:name)
  end
end
