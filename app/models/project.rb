class Project < ApplicationRecord
  belongs_to :user
  belongs_to :category

  # accepts_nested_attributes_for :categories, allow_destroy: true
end
