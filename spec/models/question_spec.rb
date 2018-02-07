require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New Question Title", body: "New question body", resolved: false) }
  
  describe "attributes" do
    it "has title, body and resolved attributes" do
      expect(question).to have_attributes(title: "New Question Title", body: "New question body", resolved: false)
    end
  end
end
