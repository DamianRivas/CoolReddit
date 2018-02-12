require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let (:advertisement) { Advertisement.create!(title: "Buy this!", copy: "This is the best!", price: 100) }
  
  describe "attributes" do
    it "has title, body and price attributes" do
      expect(advertisement).to have_attributes(title: "Buy this!", copy: "This is the best!", price: 100)
    end
  end
end
