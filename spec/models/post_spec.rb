require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  
  describe "attributes" do
    it "has title and body attributes" do
      expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
    end
  end
  
  describe "#censor" do
    it "censors the title of a given post" do
      post.censor
      
      expect(post.title).to eq "SPAM"
    end
  end
end
