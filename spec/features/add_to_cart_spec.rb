require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.sentence(3),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 54.23
      )
    end
  end

  scenario "User adds product to cart" do

    visit root_path

    first("article.product").find_button("Add", disabled: false).hover.click

    expect(page).to have_text "My Cart (1)"
  end
end
