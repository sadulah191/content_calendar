# frozen_string_literal: true

class ContentItem < ApplicationRecord
  belongs_to :user
  has_many :publishing_targets, dependent: :destroy
  has_many :social_networks, through: :publishing_targets

  accepts_nested_attributes_for :publishing_targets, allow_destroy: true,
                                                     reject_if: proc { |attributes|
                                                                  attributes['social_network_id'].blank? || attributes['publishing_date'].blank?
                                                                }

  has_rich_text :body
end
