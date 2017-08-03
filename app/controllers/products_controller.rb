class ProductsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit]

  def index
  	@products = Product.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Your product has been created!"
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params [:id])
  	if @product.update_attributes(product_params)
  		#handle successful update
    else
	  render 'edit'
  	end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :warehouse,)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
