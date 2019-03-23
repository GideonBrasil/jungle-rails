class ReviewsController < ApplicationController
    before_filter :logged_in

    def create
        
        @review = Review.new(review_params)
        @review.user = current_user

        if @review.save
            @product = Product.find params[:product_id]
            redirect_to @product, notice: 'Review created!'
        end

    end

    def logged_in
        if !current_user
            redirect_to login_path
        end
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
