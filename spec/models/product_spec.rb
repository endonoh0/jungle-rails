require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

  before :each do
    @category = Category.create(name: 'Flowers')

    @product = @category.products.create({
      name:  'Sunflower',
      description: "Flower for sale",
      quantity: 4,
      price: 11.11
    })
  end

  context "Name:" do

    it "Should validate the presence of the product name" do
      expect(@product.name.present?).to eq(true)
    end
  end

  context "Price:" do

    it "Should validate the presence of a product price" do
      expect(@product.price.present?).to eq(true)
    end
  end

  context "Quantity:" do

    it "Should validate the presence of a product quantity" do
      expect(@product.quantity.present?).to eq(true)
    end
  end

  context "Category:" do

    it "Should validate the presence of a product category" do
      expect(@product.category.present?).to eq(true)
    end
  end

end
end
