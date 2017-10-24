class TargetGroup < ApplicationRecord
  belongs_to :parent, class_name: 'TargetGroup',
    inverse_of: :children,
    foreign_key: :parent_id,
    optional: true

  has_many :children, class_name: 'TargetGroup',
    inverse_of: :parent,
    foreign_key: :id

  belongs_to :panel_provider

  has_and_belongs_to_many :countries
end
