class Project < ApplicationRecord
  belongs_to :users
  has_ancestry
end
