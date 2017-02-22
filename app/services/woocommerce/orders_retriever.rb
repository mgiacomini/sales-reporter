module Services
  module Woocommerce
    class OrdersRetriever

      def initialize(wordpress)
        self.woocommerce = wordpress.woocommerce
      end

      def all_orders(amount = 200, page = 1, status = 'processing')
        all_orders = []

        while true
          response = woocommerce.get("orders?page=#{page}&per_page=100&status=#{status}").parsed_response
          break if response.none?
          all_orders.concat(response)
          yield(response) if block_given?
          break if all_orders.count >= amount
          page += 1
        end

        all_orders
      rescue
        @error = "Erro ao importar pedidos do Wordpress, favor verificar configurações."
      end

      def get_order(order_id)
        woocommerce.get("orders/#{order_id}").parsed_response
      end

      def get_notes(order)
        woocommerce.get("orders/#{order["id"]}/notes").parsed_response
      end

      private

      attr_accessor :woocommerce

    end
  end
end