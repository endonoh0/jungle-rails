require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    2.times do |n|
      @category.products.create!(
        name: "Zebra Shirt",
        description: Faker::Hipster.sentence(3),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 54.23
      )
    end
  end

  scenario "They see the specific product" do

    visit root_path

    first("article.product").find_link("Details").hover.click

    expect(page).to have_css 'article.product-detail', count: 1
  end
end
