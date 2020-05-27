class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @allwares = Ware.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @allwares = Ware.all
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  def new
    @allwares = Ware.all
    @order = Order.new
    @tuser=session[:tuser]
    if @tuser!=nil then
      @ware_shop= session[:ware_shopping]
      @total=0
    end
    if @ware_shop!=nil then
      @ware_shop.each do |key,value|
        @total += @allwares.find_by_wname(key).wprice * value
      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @allwares = Ware.all
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @allwares = Ware.all
    @order = Order.new
    @order.uname = params[:order][:uname]
    @order.uphone = params[:order][:uphone]
    @order.uhomephone = params[:order][:uhomephone]
    @order.uaddress = params[:order][:uaddress]
    @order.upost = params[:order][:upost]
    @order.price = params[:order][:price]
    @order.save
    redirect_to @order
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @allwares = Ware.all
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def emptyOrder
    # Order.delete_all
    @order = Order.find(params[:id])
    @order.destroy
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    puts "ddddddddddd"
    puts "dddddddddddddddddddddddddd"
    redirect_to home_index_url, :notice => "Your order has been deleted successfully."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:uname, :uaddress, :upost, :uphone, :uhomephone, :price)
    end
end
