module Services

  ## Data importation for WooCommerce platform
  class DataImporter

    def create_order_params(order_json={})
      created_at = order_json.delete('date_created')
      updated_at = order_json.delete('date_modified')
      paid_at = order_json.delete('date_paid')
      completed_at = order_json.delete('date_completed')

      p = order_json.merge(created_at: created_at, updated_at: updated_at, paid_at: paid_at, completed_at: completed_at)
      p.reject { |k, v| !Order.column_names.include? k }
    end

    ## Update or Create a Order
    def save_order(params={})
      order = Order.find_by_number! params['number']
      order.update_attributes params
    rescue ActiveRecord::RecordNotFound
      Order.create(params)
    end

    def update_orders(orders)
      orders.each do |order_json|
        p "--> Atualizando pedido: #{order_json['number']}"
        save_order(create_order_params(order_json))
      end
    end

  end
end