class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  default_scope { order(position: :asc) }
end
