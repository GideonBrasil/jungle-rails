require 'rails_helper'

RSpec.feature "Visitor can navigate to show page when clicking on Product Details", type: :feature, js: true do
# SETUP
before :each do
  @category = Category.create! name: 'Apparel'

  1.times do |n|
    @category.products.create!(
      name:  Faker::Hipster.sentence(3),
      description: Faker::Hipster.paragraph(4),
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 64.99
    )
  end
  
end

scenario "They see show page" do
  # ACT
  visit root_path
  click_on 'Details'

  # DEBUG / VERIFY
  save_screenshot
  # Index page should have article.product
  # expect(page).to have_css 'article.product'
  expect(page).to have_css 'article.product-detail'
end

end
