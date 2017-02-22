require_relative '../../app/services/woocommerce/orders_retriever'
require_relative '../../app/services/data_importer'

namespace :data_importer do
  desc "Importing all orders from all wordpresses"
  task import_all_orders: :environment do
    importer = ::Services::DataImporter.new
    Wordpress.all.each do |wordpress|
      orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
      importer.update_orders orders_retriever.all_orders(20000, 1, 'any'), wordpress.id
    end
  end

  desc "Importing lasts orders from all wordpresses"
  task import_last_orders: :environment do
    importer = ::Services::DataImporter.new
    Wordpress.all.each do |wordpress|
      p "--> Wordpress: #{wordpress.name}"
      orders_retriever = ::Services::Woocommerce::OrdersRetriever.new(wordpress)
      importer.update_orders orders_retriever.all_orders(5000, 1, 'any'), wordpress.id
    end
  end
end
