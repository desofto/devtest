class Country < ApplicationRecord
  belongs_to :panel_provider
  has_and_belongs_to_many :target_groups
end
