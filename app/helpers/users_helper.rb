module UsersHelper
  def posts_comments_exist?(entity)
    entity.size > 0
  end
end
