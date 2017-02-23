require_relative 'update_order_worker'
require_relative '../services/woocommerce/orders_retriever'
require_relative '../services/data_importer'

class ImportOrdersWorker
  include Sidekiq::Worker

  def perform(wordpress_id, page)
    orders_chunk = 100
    wordpress = Wordpress.find wordpress_id
    orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress.woocommerce)
    all_orders = orders_retriever.all_orders(orders_chunk, page, 'any')
    if all_orders.count > 0
      data_importer = ::Services::DataImporter.new
      data_importer.import_orders all_orders, Wordpress.find(wordpress_id)
      self.class.perform_async wordpress_id, page+1 if all_orders.count == orders_chunk
    end
  end

  def self.import_all
    Wordpress.all.each do |w|
      perform_async(w.id, 1)
    end
  end

end