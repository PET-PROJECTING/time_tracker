require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number.with_options(searchable: false),
    body: Field::Text.with_options(searchable: false),
    date: Field::Date.with_options(searchable: false),
    title: Field::String.with_options(searchable: true),
    user: Field::BelongsTo.with_options(searchable: false),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    status: Field::Text.with_options(direction: :desc, searchable: false)
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    user
    title
    body
    date
    status
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    body
    date
    title
    user
    created_at
    updated_at
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    body
    date
    user
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
