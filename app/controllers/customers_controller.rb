class CustomersController < ApplicationController
  def index
    render json: Customer.all, root: false
  end
end