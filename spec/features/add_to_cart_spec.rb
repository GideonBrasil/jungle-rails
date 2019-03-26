require 'rails_helper'

RSpec.feature "User can Add product To Cart", type: :feature, js: true do
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

  scenario "They see that a product was added to cart" do
    # ACT
    visit root_path

    #code
    first('.product').click_link('Add')

    # DEBUG / VERIFY
    save_screenshot
    # Index page should have article.product
    # expect(page).to have_css 'article.product'
    expect(page).to have_text 'My Cart (1)'
    save_screenshot
  end

end
