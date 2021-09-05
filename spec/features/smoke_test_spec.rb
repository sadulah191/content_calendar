# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SmokeTests', type: :feature do
  it 'base content creation', js: true do
    user = create :user

    sign_in user
    visit root_path

    # Add social network
    click_on 'Social Networks'
    click_on 'Add social network'
    fill_in 'Description', with: "Jon's Facebook"
    click_on 'Create Social network'
    expect(page).to have_content("Jon's Facebook added")

    # Add content
    click_on 'Content Items'
    click_on 'Add Content item'
    fill_in 'Title', with: 'My Title'
    fill_in_rich_text_area 'Body', with: 'My body'
    click_on 'Create Content item'
    expect(page).to have_content('My Title added')

    # View Content
    within '#content-items' do
      click_on 'My Title'
    end
    expect(page).to have_content('My body')

    # add social network
    click_on 'Edit'
    check "Jon's Facebook"
    click_on 'Update Content item'
    expect(page).to have_content('My Title updated')
    click_on 'My Title'
    expect(page).to have_content("Jon's Facebook")

    # delete content
    accept_confirm do
      click_on 'Delete'
    end
    expect(page).to have_content('My Title deleted')
    expect(page).not_to have_link('My Title')
  end
end
