class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def checkname
    # puts params[:uname]
    names = User.find_by_uname(params[:uname])
    # puts "start checking names"
    if names!=nil then
      @msg="用户名已经使用 请重新输入"
    else
      @msg="欢迎注册"
    end
    respond_to do |format|
      format.html {render :layout=>false}
      format.xml {render :xml=>@msg}
      format.json { render json: @users }
    end
  end

  def showLogin
    render :"/users/showLogin" , :layout=>"user"
  end

  def login
    uname=params[:user][:name]
    upass=params[:user][:pass]
    session[:tuser] = nil
    user = User.find_by_uname(uname)
    if user && user.upwd == upass
      session[:tuser]=user
      @tuser=session[:tuser]
      redirect_to root_url
    else
      session[:tuser] = nil
      flash[:notice]="error"
      puts 'error'
      redirect_to :action=>"errorLogin"
    end
  end

  def errorLogin
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:uname, :upwd, :umail, :uphone, :uadress, :uimpower)
    end
end
