class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /order
  # GET /order.json
  def index
    @orders = ["buy"=> Order.where(operation_type:"buy")]
    @orders = @orders.push( "sold"=> Order.where(operation_type:"sold"))

    render json: @orders
  end

  # GET /order/1
  # GET /order/1.json
  def show
    if @order
      render json: @order
    else
      render json: @order.errors
    end
  end

  # GET /order/new
  def new
    @order = Order.new
  end

  # POST /order
  # POST /order.json
  def store
    @order = Order.new(order_params)
    @order.order_number = rand(1000000..9999999)
    @order.visible = true

    if @order.save
      render json: @order
    else
      render json: @order.errors
    end
  end

  # PATCH/PUT /order/1
  # PATCH/PUT /order/1.json
  def update
    if @order
      @order.update(order_params)
      @response = @order
    end

    render json: @response
  end

  # DELETE /order/1
  # DELETE /order/1.json
  def destroy
    @order.destroy

    render json: { notice: 'Order was successfully removed.' }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.permit(:price, :operation_type)
  end
end
