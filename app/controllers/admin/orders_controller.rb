require_relative '../../workers/import_orders_worker'

module Admin
  class OrdersController < ApplicationController

    def update_orders
      ImportOrdersWorker.import_all
      redirect_to admin_orders_path, notice: "Orders updating! Wait a few minutes until complete."
    end

  end
end
