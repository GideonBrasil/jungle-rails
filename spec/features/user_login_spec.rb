require 'rails_helper'

RSpec.feature "Determine that a user is logged in", type: :feature, js: true do
  # SETUP
before :each do

  @user = User.create!(
    first_name: 'Mazli',
    last_name: 'Barton',
    email: 'mazli@gmail.com',
    password: 'wofwof',
    password_confirmation: 'wofwof'
  )

  @category = Category.create! name: 'Apparel'
  10.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
    end
  end

  scenario "They see that their email is displayed on the navbar" do
    # ACT
    visit new_session_path
    
    within 'form' do
      fill_in id: 'session_email', with: 'mazli@gmail.com'
      fill_in id: 'session_password', with: 'wofwof'

      click_button 'Sign in'
    end

    visit root_path
    #code

    # DEBUG / VERIFY
    # save_screenshot
    # Index page should have article.product
    # expect(page).to have_css 'article.product'
    expect(page).to have_content 'Signed in as mazli@gmail.com'
    save_screenshot
  end
  
end
