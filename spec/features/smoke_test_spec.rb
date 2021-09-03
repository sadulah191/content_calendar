require 'rails_helper'

RSpec.feature 'SmokeTests', type: :feature do
  scenario 'base content creation' do
    user = create :user

    sign_in user
    visit root_path

    # Add social network
    click_on 'Social networks'
    click_on 'Add social network'
    fill_in 'Description', with: "Jon's Facebook"
    click_on 'Create Social network'
    expect(page).to have_content("Jon's Facebook added")

    # Add content
    click_on 'Content Items'
    click_on 'Add Content item'
    fill_in 'Title', with: 'My Title'
    fill_in 'Body', with: 'My body'
    click_on 'Create Content item'
    expect(page).to have_content('My Title added')

    # View Content
    within '#content-items' do
      click_on 'My Title'
    end
    expect(page).to have_content('My body')

    # add social network
    click_on 'Edit'
    check_on 'Facebook'
    click_on 'Update Content'
    expect(page).to have_content('Updated My Title')
    expect(page).to have_content('Facebook')

    # delete content
    accept_confirm do
      click_on 'Delete'
    end
    expect(page).to have_content('My Title deleted')
  end
end
