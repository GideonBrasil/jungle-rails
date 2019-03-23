class Review < ActiveRecord::Base

    belongs_to :products
    belongs_to :users

    # validates :user_id, presence: { message: "Must sign in to review a product" }
    # validates :user_id, uniqueness: { scope: :product_id, message: "You can only rate a product once" }
    # validates :product_id, presence: true
    validates :description, presence: true
    validates :rating, presence: true,
              numericality: true,
              inclusion: { in: 1..5 }

end
