class ReviewsController < ApplicationController
    before_filter :logged_in

    def create
        
        @review = Review.new(review_params)
        @review.user_id = current_user.id
        @review.save
        @product = Product.find params[:product_id]
        redirect_to @product, notice: 'Review created!'

    end

    def logged_in
        if !current_user
            redirect_to login_path
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        @product = Product.find params[:product_id]
        redirect_to @product, notice: 'Product deleted!'
    end

    private

    def review_params
        params.require(:review).permit(
            :description,
            :rating,
            :product_id,
            :user_id
        )
    end

end
