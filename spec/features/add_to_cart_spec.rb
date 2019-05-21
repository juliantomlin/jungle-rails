require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apperel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end
  end

  scenario "clicking 'add to cart' will add something to the cart" do

    visit root_path

    page.find('button', text: 'Add', match: :first).click

    expect(page).to have_content("My Cart (1)")

  end

end
