require_relative '../services/data_importer'

class UpdateOrderWorker
  include Sidekiq::Worker

  def perform(params={})
    importer = ::Services::DataImporter.new
    importer.update_order params
  end

end