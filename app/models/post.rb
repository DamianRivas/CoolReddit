class Post < ApplicationRecord
  has_many :comments
  
  def censor
    self.title = "SPAM"
  end
end
