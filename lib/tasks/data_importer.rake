require_relative '../../app/services/woocommerce/orders_retriever'

def save_order(params={})
  order = Order.find_by_number! params['number']
  order.update_attributes params
rescue ActiveRecord::RecordNotFound
  Order.create(params)
end

def create_order_params(order_json={})
  created_at = order_json.delete('date_created')
  updated_at = order_json.delete('date_modified')
  paid_at = order_json.delete('date_paid')
  completed_at = order_json.delete('date_completed')

  order_json.merge(created_at: created_at, updated_at: updated_at, paid_at: paid_at, completed_at: completed_at)
end

namespace :data_importer do
  desc "Importing all orders from all wordpresses"
  task import_all_orders: :environment do
    Wordpress.all.each do |wordpress|
      orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
      orders_retriever.all_orders(100000, 1, 'any')
    end
  end

  desc "Importing lasts orders from all wordpresses"
  task import_last_orders: :environment do
    Wordpress.all.each do |wordpress|
      p "--> Wordpress: #{wordpress.name}"
      orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
      all_orders = orders_retriever.all_orders(1000, 1, 'any')
      p all_orders.inspect
      #all_orders.each do |order_json|
      #  p "--> Atualizando pedido: #{order_json['number']}"
      #  save_order(create_order_params(order_json))
      #end
    end
  end
end