require 'spec_helper'

feature 'Project manager for new user and user without lists' do
  background do
    @user = create(:user)
  end
  scenario 'Successfull signin and creation of list with items' do
    visit "/"
    expect(page).to have_content("Welcome")
    click_link "Sign In"
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'helloworld'
    click_button "Sign in"
    expect(page).to have_content("Signed in successfully")
    fill_in 'My Title', with: "My List"
    click_button "Save"
    expect(page).to have_content("My List")
    fill_in "Enter Activity", with: "Test Process"
    click_button "Save"
    expect(page).to have_content("Test Process")
  end
  scenario 'Unsuccessfull signin' do
    visit new_list_path
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: "somekindofpw"
    click_button "Sign in"
    expect(page).to have_content("Invalid email")
  end
end

feature 'Project manager for user with existing list' do
  background do
    @u = create(:user) do |user|
      list = user.lists.create(attributes_for(:list))
      list.items.create(attributes_for(:item))
    end
  end

  scenario 'Successfull signin and directing to the list the users owns' do
    visit "/"
    expect(page).to have_content("Welcome")
    click_link "Sign In"
    fill_in 'Email', with: @u.email
    fill_in 'Password', with: 'helloworld'
    click_button "Sign in"
    expect(page).to have_content("Mr. Doe's")
    expect(page).to have_content("Dog")
  end
end
