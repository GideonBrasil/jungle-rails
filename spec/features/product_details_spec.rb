require 'rails_helper'

RSpec.feature "Visitor can navigate to show page when clicking on Product Details", type: :feature, js: true do
# SETUP
before :each do
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

  scenario "They see show page of a single product" do
    # ACT
    visit root_path

    #code
    first('.product').click_link('Details')

    # DEBUG / VERIFY
    # save_screenshot
    # Index page should have article.product
    # expect(page).to have_css 'article.product'
    expect(page).to have_css 'article.product-detail'
    # save_screenshot
  end

end
