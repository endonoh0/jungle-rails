require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

  before :each do
    @category = Category.create(name: 'Flowers')

    @product = @category.products.create({
      name:  'Sunflower',
      quantity: 4,
      price: 11.11
    })
  end

  context "Name:" do

    it "Should validate the presence of the product name" do
      expect(@product.name.present?).to eq(true)
    end
    it "Should be invalid when the product name is undefined" do
      expect(Product.new(category: @category, name: nil, price: 11.13, quantity: 3)).to_not be_valid
    end
  end


  context "Price:" do

    it "Should validate the presence of a product price" do
      expect(@product.price.present?).to eq(true)
    end
    it "Should be invalid when the product price is undefined" do
      expect(Product.new(category: @category, name: "true", quantity: 3)).to_not be_valid
    end
  end

  context "Quantity:" do

    it "Should validate the presence of a product quantity" do
      expect(@product.quantity.present?).to eq(true)
    end
    it "Should be invalid when the product quantity is undefined" do
      expect(Product.new(category: @category, name: "true", price: 23.23)).to_not be_valid
    end
  end

  context "Category:" do

    it "Should validate the presence of a product category" do
      expect(@product.category.present?).to eq(true)
    end
    it "Should be invalid when the product category is undefined" do
      expect(Product.new(name: "true", price: 23.23)).to_not be_valid
    end
  end
end
end
