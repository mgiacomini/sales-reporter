module Services

  ## Data importation for WooCommerce platform
  class DataImporter

    def create_order_params(order_json={})
      created_at = order_json.delete('date_created').to_datetime
      updated_at = order_json.delete('date_modified').to_datetime
      paid_at = order_json.delete('date_paid').to_datetime
      completed_at = order_json.delete('date_completed').to_datetime

      p = order_json.merge(created_at: created_at, updated_at: updated_at, paid_at: paid_at, completed_at: completed_at)
      p.reject { |k, v| !Order.column_names.include? k }
    end

    def import_orders(orders, wordpress)
      orders_chunks = []
      orders.each do |order_json|
        params = create_order_params order_json
        orders_chunks << create_order_object(params.merge(wordpress: wordpress))
      end
      Order.import orders_chunks, on_duplicate_key_update: [:status, :created_at, :updated_at, :paid_at, :completed_at]
    end

    private

    def create_order_object(params={})
      Order.new(params)
    end

  end
end