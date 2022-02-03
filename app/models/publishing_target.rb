# frozen_string_literal: true

class PublishingTarget < ApplicationRecord
  belongs_to :content_item
  belongs_to :social_network

  def start_time
    publishing_date
  end
end
