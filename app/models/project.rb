class Project < ApplicationRecord
  default_scope { order(position: :asc) }
end
