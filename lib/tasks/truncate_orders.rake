require_relative '../../app/services/woocommerce/orders_retriever'
require_relative '../../app/services/data_importer'

namespace :truncate_orders do
  desc "Truncate orders table"
  task run: :environment do
    ActiveRecord::Base.connection.execute("TRUNCATE orders RESTART IDENTITY")
  end
end
