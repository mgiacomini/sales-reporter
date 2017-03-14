module Services

  ## Data importation for WooCommerce platform
  class DataImporter

    def create_order_params(order_json={}, wordpress)
      created_at = order_json['date_created'].to_datetime
      updated_at = order_json['date_modified'].to_datetime
      paid_at = order_json['date_paid'].to_datetime
      completed_at = order_json['date_completed'].to_datetime
      p = order_json.merge({
                               'wordpress_created_at' => created_at,
                               'wordpress_updated_at' => updated_at,
                               'paid_at' => paid_at,
                               'completed_at' => completed_at,
                               'order_key' => "#{order_json['order_key']}-#{wordpress.id}-#{order_json['number']}"
                           })
      p.reject { |k, v| !Order.column_names.include? k }
    end

    def import_orders(orders, wordpress)
      orders_chunks = orders.map do |order_json|
        params = create_order_params order_json, wordpress
        create_order_object(params.merge(wordpress: wordpress))
      end

      Order.import orders_chunks, on_duplicate_key_update: {
          conflict_target: [:order_key],
          columns: [
            :status,
            :wordpress_created_at,
            :wordpress_updated_at,
            :paid_at,
            :completed_at
          ]
      }
    end

    private

    def create_order_object(params={})
      Order.new(params)
    end

  end
end