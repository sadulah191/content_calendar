class SocialNetwork < ApplicationRecord
  belongs_to :user
  has_many :publishing_targets
  has_many :content_items, through: :publishing_targets
end
