require "test_helper"

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
test "should not save order without price" do
order = Order.new
assert_not order.save, "Saved the order without a price"
end

test "should show list of orders" do
get "/api/v1/orders"
assert_response :success
assert_equal '[{"buy":[]},{"sold":[]}]', @response.body

end

test "should store orders success" do
post "/api/v1/orders",
params: { order: { price: 2000, operation_type: 1 } }
assert_response :success
end

  test "can get an order sucess" do
    @order = Order.new(price:2000,operation_type:2)
    @order.save
   get "/api/v1/orders/#{@order.id}"
  assert_response :success
  end


# test "can update an order sucess" do
# @order = Order.new(price:2000,operation_type:2)
# @order.save
# put "/api/v1/orders/#{@order.id}"
# assert_response :success
# end
end

