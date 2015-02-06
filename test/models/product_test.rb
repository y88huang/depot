require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?

  test "Product price must be positive" do
  	product = Product.new(title: "my book",
  						   description: "yyy",
  						   image_url: "zzz.jpg")
  	product.price = -1
  	assert product.invalid?
  	product.price = 1
  	assert product.invalid?
  end
end
