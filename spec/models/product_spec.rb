require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.new(name: 'Automobiles')
    @product = Product.new(name: 'Civic', price: 5, quantity: 5, category: @category)
  end

  describe 'Validations' do
    it 'will save successfully to db if product contains name, price, quantity and a category' do
     expect(@product.save).to be_truthy
    end


    it 'is not valid without a name' do
      @product.name = nil
      @product.save
      # expect(@product.errors.messages).to include name: ["can't be blank"] 
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'is not valid without a price' do
      @product.price_cents = nil
      @product.save
      # expect(@product.errors.messages).to include name: ["can't be blank"]
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'is not valid without a quantity' do
      @product.quantity = nil
      @product.save
      # expect(@product.errors.messages).to include name: ["can't be blank"] 
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'is not valid without a category_id' do
      @product.category = nil
      @product.save
      # expect(@product.errors.messages).to include name: ["can't be blank"] 
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end

end
