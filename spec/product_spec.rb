require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before {
      @category = Category.new(name: 'test')
      @product_params = {
        name: 'Pen',
        price: 100,
        quantity: 10,
        category: @category
      }
    }

    it 'should save successfully when not missing name, price, quantity, and category' do
      @product = Product.new(@product_params)
      @product.save!

      expect(@product.id).to be_present
    end
    
    it 'should not save when missing a name' do
      @product_params[:name] = nil
      @product = Product.new(@product_params)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save when missing a price' do
      @product_params[:price] = nil
      @product = Product.new(@product_params)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save when missing a quantity' do
      @product_params[:quantity] = nil
      @product = Product.new(@product_params)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save when missing a category' do
      @product_params[:category] = nil
      @product = Product.new(@product_params)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end