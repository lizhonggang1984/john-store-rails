class CartController < ApplicationController
  def index
    @allwares = Ware.all
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
  end

  def addcart
    #判断用户是否为空
    @tuser=session[:tuser]

    if @tuser!=nil then
      #根据商品ID查询一条信息
      ware=Ware.find(params[:id]).wname
      #判断存入到购物车对象
      if (session[:ware_shopping]==nil) then
        session[:ware_shopping] = Hash.new
      end

      #判断购物车对象中是否存在商品对象 (存在则加数量加1)
      if(session[:ware_shopping].has_key?(ware)) then
        session[:ware_shopping][ware]= session[:ware_shopping][ware]+1
      else
        session[:ware_shopping][ware] = 1
      end

      redirect_to :action=>"index"
    else
      redirect_to :action=>"showLogin",:controller=>"users"
    end
  end

  def deleteWare
    deleteName = params[:wname]
    puts deleteName
    @tuser=session[:tuser]
    if @tuser!=nil then
      wareName =Ware.find_by_wname(deleteName).wname
      if(session[:ware_shopping]==nil) then
        session[:ware_shopping]=Hash.new
      end

      ware_shop=session[:ware_shopping]

      if ware_shop.has_key?(wareName) then
        ware_shop.delete(wareName)
      end

      puts 'deleted'
      redirect_to :action=>"index"
    else
      redirect_to :action=>"showLogin",:controller=>"users"
    end
  end

  def emptyWare
    @tuser=session[:tuser]
    if @tuser!=nil then
      session[:ware_shopping]=nil
      redirect_to :action=>"index"
    end
  end

  def checkout

  end

end