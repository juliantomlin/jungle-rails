require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They can navigate to product details with a button click" do

    visit root_path

    page.find("a.btn", match: :first).click

    expect(page).to have_content("Name" && "Description" && "Quantity" && "Price")

  end

end
