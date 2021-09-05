# frozen_string_literal: true

class PublishingTarget < ApplicationRecord
  belongs_to :content_item
  belongs_to :social_network
end
