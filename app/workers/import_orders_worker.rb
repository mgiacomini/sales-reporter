require_relative 'update_order_worker'
require_relative '../services/woocommerce/orders_retriever'

class ImportOrdersWorker
  include Sidekiq::Worker

  def perform(wordpress_id, amount)
    wordpress = Wordpress.find wordpress_id
    orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
    orders_retriever.all_orders amount, 1, 'any' do |o|
      update_order o.merge(wordpress_id: wordpress_id)
    end
  end

  def self.import_all
    max_orders_number = 10000
    Wordpress.all.each do |w|
      perform_async(w.id, max_orders_number)
    end
  end

  private
  def update_order(order)
    UpdateOrderWorker.perform_async order
  end

end