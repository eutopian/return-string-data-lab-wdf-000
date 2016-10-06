class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def create
		product = Product.create(products_params)
		redirect_to products_path
	end

	def description
		product = Product.find(params[:id])
		render plain: product.description
	end

	def inventory
		product = Product.find(params[:id])
		render plain: product.inventory > 0
	end

	private
		def products_params
			params.require(:product).permit(:name, :description, :inventory, :price)
		end
end