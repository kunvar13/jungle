class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['username'], password: ENV['password']
  def show
    @products = Product.order(id: :desc).all
    @category = Category.all
  end
end
