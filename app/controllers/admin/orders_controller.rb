require_relative '../../services/woocommerce/sales_reporter'
require_relative '../../services/sales_report_creator'
module Admin
  class OrdersController < ApplicationController

    def index
      @wordpresses = Wordpress.all
      @general_report = Report.group_by_day(:created_at).sum(:sales)
      super
    end

    def update_reports
      Wordpress.all.each do |w|
        reporter = ::Services::Woocommerce::SalesReporter.new(w.woocommerce)
        report = reporter.create_report(30.days.ago, Date.today)
        ::Services::SalesReportCreator.create report['totals'].as_json, w
      end

      redirect_to admin_orders_path, notice: 'Reports were updated'
    end

  end
end
