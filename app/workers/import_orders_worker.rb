require_relative 'update_order_worker'
require_relative '../services/woocommerce/orders_retriever'

class ImportOrdersWorker
  include Sidekiq::Worker

  def perform(wordpress_id, amount)
    wordpress = Wordpress.find wordpress_id
    orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
    orders_retriever.all_orders(amount, 1, 'any')

    importer = ::Services::DataImporter.new
    importer.update_orders orders_retriever, wordpress_id
  end

  def self.import_all
    max_orders_number = 1000
    Wordpress.all.each do |w|
      perform_async(w.id, max_orders_number)
    end
  end

end