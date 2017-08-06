class WarehousesController < ApplicationController
  include SessionsHelper
  before_action :admin_user, only: [:new, :create, :edit, :destroy]

  def index
    @warehouse = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:success] = "Your warehouse has been created!"
      redirect_to @warehouse
    else
      render 'new'
    end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
  end

  def update
    @warehouse = Warehouse.find(params[:id])
    if @warehouse.update_attributes(warehouse_params)
      flash[:success] = "Warehouse updated"
        redirect_to @warehouse
    else
    render 'edit'
    end
  end

  def destroy
    Warehouse.find(params[:id]).destroy
    flash[:success] = "Warehouse deleted"
    redirect_to products_path
  end

  private
    def warehouse_params
      params.require(:warehouse).permit(:name, :street, :city, :state, :zip, :phone)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
