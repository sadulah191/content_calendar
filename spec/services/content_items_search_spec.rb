# frozen_string_literal: true

require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe ContentItemsSearch, type: :service do
  let(:user) { create(:user) }
  let(:social_network) { create(:social_network, user: user) }
  let(:content_item) { create(:content_item, title: 'test', user: user) }
  let(:publishing_target) { create(:publishing_target, content_item: content_item, social_network: social_network) }

  context 'when params search query is present' do
    let(:params) { { search: { search_query: 'tes' } } }

    it 'return publishing_target' do
      search = described_class.new(params[:search], user)
      publishing_targets = search.results

      expect(publishing_targets.first.content_item.title).to eq(content_item.title)
    end
  end

  context 'when params social_network query is present' do
    let(:params) { { search: { social_network: social_network.id } } }

    it 'return publishing_target' do
      search = described_class.new(params[:search], user)
      publishing_targets = search.results

      expect(publishing_targets.first.social_network.description).to eq(social_network.description)
    end
  end

  context 'when params social_network & search query is present' do
    let(:params) { { search: { search_query: 'tes', social_network: social_network.id } } }

    it 'return publishing_target' do
      search = described_class.new(params[:search], user)
      publishing_targets = search.results

      expect(publishing_targets.first.content_item.title).to eq(content_item.title)
    end
  end
end
# rubocop:enable Metrics/BlockLength
