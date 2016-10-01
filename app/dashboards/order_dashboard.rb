require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    products: Field::HasMany,
    line_items: Field::HasMany,
    user: Field::BelongsTo,
    id: Field::Number,
    number: Field::String,
    item_total: Field::String.with_options(searchable: false),
    total: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    state: Field::String,
    completed_at: Field::DateTime,
    bill_address_id: Field::Number,
    payment_total: Field::String.with_options(searchable: false),
    payment_state: Field::String,
    email: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :products,
    :line_items,
    :user,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :products,
    :line_items,
    :user,
    :id,
    :number,
    :item_total,
    :total,
    :created_at,
    :updated_at,
    :state,
    :completed_at,
    :bill_address_id,
    :payment_total,
    :payment_state,
    :email,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :products,
    :line_items,
    :user,
    :number,
    :item_total,
    :total,
    :state,
    :completed_at,
    :bill_address_id,
    :payment_total,
    :payment_state,
    :email,
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
