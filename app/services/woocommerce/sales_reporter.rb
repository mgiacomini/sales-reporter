module Services
  module Woocommerce
    class SalesReporter

      def initialize(woocommerce)
        @woocommerce = woocommerce
      end

      def create_report(date_min, date_max)
        query = {
            date_min: date_min.strftime('%F'), #=> format to 2014-01-23
            date_max: date_max.strftime('%F')
        }

        @woocommerce.get("reports/sales", query).parsed_response.first
      end

    end
  end
end