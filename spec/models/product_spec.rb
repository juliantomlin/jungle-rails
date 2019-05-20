require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    category = Category.new(
      name: "test"
      )

    category.save

    it "should return a valid product" do

      product = Product.new(
        name: 'thing',
        price: 100,
        quantity: 5,
        category: category
        )
      expect(product).to be_valid
    end

    it "should be invalid if there is no name" do

      product2 = Product.new(
        name: nil,
        price: 100,
        quantity: 5,
        category: category
        )
      expect(product2).to_not be_valid
    end

    it "should be invalid if there is no price" do

      product3 = Product.new(
        name: "thing",
        price: nil,
        quantity: 5,
        category: category
        )
      expect(product3).to_not be_valid
    end

    it "should be invalid if there is no quantity" do

      product3 = Product.new(
        name: "thing",
        price: 100,
        quantity: nil,
        category: category
        )
      expect(product3).to_not be_valid
    end

    it "should be invalid if there is no category" do

      product4 = Product.new(
        name: "thing",
        price: 100,
        quantity: 5,
        category: nil
        )
      expect(product4).to_not be_valid
    end

  end
end
