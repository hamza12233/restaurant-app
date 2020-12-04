class Api::V1::CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token


    def index
        @categories = Category.all
        render json: @categories
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            render json: { result: true, msg: ' The image is sucessfully uploaded!!'}, status: :created
        else
            render json: {result: false, category: @category.errors }, status: :unprocessable_entity
        end
    end


    private 
    def category_params
        params.permit(:name, :avatar)
    end


end
