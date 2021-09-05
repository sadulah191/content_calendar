class ContentItem < ApplicationRecord
  belongs_to :user
  has_many :publishing_targets, dependent: :destroy
  has_many :social_networks, through: :publishing_targets

  has_rich_text :body
end
