require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number.with_options(searchable: false),
    age: Field::Number.with_options(searchable: false),
    email: Field::String.with_options(searchable: true),
    password: Field::String.with_options(searchable: false),
    encrypted_password: Field::String.with_options(searchable: false),
    first_name: Field::String.with_options(searchable: false),
    last_name: Field::String.with_options(searchable: false),
    nickname: Field::String.with_options(searchable: false),
    type: Field::String.with_options(searchable: true),
    posts: Field::HasMany.with_options(searchable: false, limit: 1000, sort_by: :id, direction: :desc),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false)
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    age
    email
    posts
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    nickname
    first_name
    last_name
    age
    email
    posts
  ].freeze

  FORM_ATTRIBUTES = %i[
    first_name
    last_name
    nickname
    email
    password
    age
    type
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
