require_relative '../services/data_importer'
require_relative '../services/woocommerce/orders_retriever'

class ImportOrdersWorker
  include Sidekiq::Worker

  def perform(wordpress_id, amount)
    wordpress = Wordpress.find wordpress_id
    orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
    update_orders orders_retriever.all_orders(amount, 1, 'any')
  end

  def self.import_all
    max_orders_number = 1000000
    Wordpress.all.each do |w|
      perform_async(w.id, max_orders_number)
    end
  end

  private
  def update_orders(orders)
    importer = ::Services::DataImporter.new
    importer.update_orders orders
  end

end