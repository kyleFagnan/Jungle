require 'rails_helper'

 RSpec.feature "Visitor navigates from home to product detail page", type: :feature, js: true do

   
   before :each do
     @category = Category.create! name: 'Apparel'

     @category.products.create!(
       name:  Faker::Hipster.sentence(3),
       description: Faker::Hipster.paragraph(4),
       image: open_asset('apparel1.jpg'),
       quantity: 10,
       price: 64.99
     )
   end

   scenario "They see product details" do
     # ACT
     visit root_path
     click_link("Details »", match: :first)

     # DEBUG
     # puts page.html # output current HTML being rendered by browser
     save_screenshot

     # VERIFY
     expect(page).to have_css 'section.products-show', count: 1
   end

 end
