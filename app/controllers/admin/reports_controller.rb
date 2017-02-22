module Admin
  class ReportsController < ApplicationController

    def index
      @orders = Order.all
      super
    end

  end
end
