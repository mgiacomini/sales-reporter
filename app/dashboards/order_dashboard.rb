require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard

  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      id: Field::Number,
      wordpress: Field::BelongsTo,
      status: Field::String,
      order_key: Field::String,
      number: Field::String,
      shipping_total: Field::String,
      discount_total: Field::String,
      total: Field::String,
      total_tax: Field::String,
      payment_method: Field::String,
      payment_method_title: Field::String,
      customer_ip_address: Field::String,
      customer_user_agent: Field::String,
      completed_at: Field::DateTime,
      created_at: Field::DateTime,
      paid_at: Field::DateTime,
      updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :wordpress,
      :number,
      :total,
      :status,
      :created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
      :wordpress,
      :status,
      :order_key,
      :number,
      :shipping_total,
      :discount_total,
      :total,
      :total_tax,
      :payment_method,
      :payment_method_title,
      :customer_ip_address,
      :customer_user_agent,
      :completed_at,
      :created_at,
      :paid_at,
      :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
      :wordpress,
      :status,
      :order_key,
      :number,
      :shipping_total,
      :discount_total,
      :total,
      :total_tax,
      :payment_method,
      :payment_method_title,
      :customer_ip_address,
      :customer_user_agent,
      :completed_at,
      :created_at,
      :paid_at,
      :updated_at,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(order)
    "Order ##{order.number}"
  end
end
