module Admin
  class ReportsController < ApplicationController
    helper ReportsHelper
    before_action :set_filter_params

    def index
      @bought_by_day = orders.converted.group_by_day(:wordpress_created_at).sum(:total)
      @bought_by_status = orders.group(:status).sum(:total)
      @number_of_orders_by_status = orders.group(:status).count
      super
    end

    def orders_found?
      return true if orders.count > 0
      false
    end


    helper_method :orders_found?

    private
    def set_filter_params
      @filter_date_begin_term = filter_params[:filter_date_begin] ? Date.parse(filter_params[:filter_date_begin]) : nil
      @filter_date_end_term = filter_params[:filter_date_end] ? Date.parse(filter_params[:filter_date_end]) : nil
    end

    def orders
      if !@filter_date_begin_term.nil? and !@filter_date_end_term.nil?
        return Order.between_dates @filter_date_begin_term, @filter_date_end_term
      end

      Order.last_30_days
    end

    def filter_params
      params.permit(:filter_date_begin, :filter_date_end)
    end
  end
end
