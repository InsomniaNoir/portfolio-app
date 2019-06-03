module BlogsHelper
  def gravatar_helper(user)
    image_tag "https://www.gravatar.com/avatar/#{Digest::MDS.hexdigest(user.email)}", width: 60 
  end
end
