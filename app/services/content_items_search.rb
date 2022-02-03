# frozen_string_literal: true

class ContentItemsSearch
  attr_accessor :search_query, :social_network, :current_user

  def initialize(params, current_user)
    if params.present?
      @search_query = params[:search_query]
      @social_network = params[:social_network]
    end
    @current_user = current_user
  end

  def social_networks_options
    current_user.social_networks.map { |social_network| [social_network.description, social_network.id] }.to_h
  end

  def results
    scope = PublishingTarget.joins(content_item: :rich_text_body).where(content_items: { user_id: current_user.id })
    scope = scope.where('content_items.title LIKE ? OR body ILIKE ?', "%#{search_query}%", "%#{search_query}%") if search_query.present?
    scope = scope.where(publishing_targets: { social_network_id: social_network }) if social_network.present?
    scope
  end
end
