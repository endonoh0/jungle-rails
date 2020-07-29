require 'rails_helper'

RSpec.feature "ProductQuantityAdjustments", type: :feature do
  describe 'After creation' do

    before :each do
      fruit = Category.create!(name: 'Fruits')
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!({
        name: "Apple",
        description: Faker::Hipster.sentence(3),
        quantity: 10,
        price: 54.23,
        category: fruit
      })

      @product2 = Product.create!({
        name: "Pear",
        description: Faker::Hipster.sentence(3),
        quantity: 23,
        price: 10.11,
        category: fruit
      })
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!({
        name: "Watermelon",
        description: Faker::Hipster.sentence(3),
        quantity: 5,
        price: 133.11,
        category: fruit
      })
    end

    it 'deducts quantity from products based on their line item quantities' do
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
      @order = Order.new({
        total_cents: 2323123,
        stripe_charge_id: 1,
        email: "tester@email.com"
      })
      # 2. build line items on @order
      @order.line_items.new({
        product: @product1,
        quantity: 10,
        item_price: 54.23,
        total_price: 540.23
      })
      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.line_items.new({
        product: @product2,
        quantity: 10,
        item_price: 10.11,
        total_price: 100.11
      })

      # 3. save! the order - ie raise an exception if it fails (not expected)
      @order.save!
      # 4. reload products to have their updated quantities
      @product1.reload
      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      expect(@product1.quantity).to eql(0)
      expect(@product2.quantity).to eql(13)
      expect(@product3.quantity).to eql(5)
    end
  end
end
