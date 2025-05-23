require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    email: Field::String,
    comment: Field::String,
    password: Field::Password,
    encrypted_password: Field::String,
    remember_created_at: Field::DateTime,
    confirmed_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    announcements_last_read_at: Field::DateTime,
    admin: Field::Boolean,
    master_admin: Field::Boolean,
    approved: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    disabled: Field::Boolean,
    profile_image: Field::ActiveStorage,
    questionnaires: Field::HasMany,
    answers: Field::HasMany,
    daily_notification_time: Field::Time,
    track_notifications: Field::Boolean,
    daily_report_sent_at: Field::DateTime,
    daily_notifications: Field::Boolean,
    features: FeaturesField
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  first_name
  last_name
  profile_image
  email
  disabled
  answers
  approved
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  id
  email
  first_name
  last_name
  admin
  master_admin
  approved
  disabled
  confirmed_at
  answers
  created_at
  updated_at
  profile_image
  daily_notification_time
  track_notifications
  daily_report_sent_at
  daily_notifications
  features
  comment
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  email
  first_name
  last_name
  disabled
  confirmed_at
  admin
  master_admin
  password
  approved
  track_notifications
  daily_report_sent_at
  daily_notifications
  features
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    user.name
  end

  def permitted_attributes(action = nil)
    super + [{ features: {} }]
  end
end
