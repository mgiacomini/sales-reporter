module Admin
  class ReportsController < ApplicationController

    def index
      @orders = Order.last_30_days
      super
    end

  end
end
