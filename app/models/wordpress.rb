require 'woocommerce_api'

class Wordpress < ApplicationRecord
  has_many :orders
  has_many :reports
  validates :name, :url, :consumer_key, :consumer_secret, presence: true

  def woocommerce
    WooCommerce::API.new(
        self.url,
        self.consumer_key,
        self.consumer_secret,
        {
            wp_api: true,
            version: "wc/v1"
        }
    )
  end

end
