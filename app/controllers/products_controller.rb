class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @reviewAvg = Review.where(product_id: @product.id).average(:rating).to_i.round 1
    @reviewPeople = Review.where(product_id: @product.id).sum(:rating).to_i
  end

end
