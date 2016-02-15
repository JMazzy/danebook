module LikesHelper

  def like_phrase(likes)
    phrase = ""
    num_likes = likes.count(:user_id)
    self_liked = !!likes.find_by(user_id: current_user.id)
    other_likes = likes.where("user_id != #{current_user.id}")

    if self_liked

      phrase << ( link_to "You", current_user )

      if num_likes == 1
        # nothing else added
      elsif num_likes == 2
        phrase << " and #{ link_to other_likes.first.user.full_name, other_likes.first.user }"
      else
        phrase << ", #{ link_to other_likes.first.user.full_name, other_likes.first.user }"
        if num_likes == 3
          phrase << " and #{ link_to other_likes.second.user.full_name, other_likes.second.user }"
        elsif num_likes == 4
          phrase << ", #{ link_to other_likes.second.user.full_name, other_likes.second.user } and 1 other person"
        else
          phrase << ", #{ link_to other_likes.second.user.full_name, other_likes.second.user } and #{ num_likes - 3 } other people"
        end
      end

      phrase <<  " like this."
    else
      if num_likes == 1
        phrase << "#{ link_to likes.first.user.full_name, likes.first.user } likes this."
      else
        phrase << "#{ link_to like_name(likes.first), likes.first.user }"
        if num_likes == 2
          phrase << " and #{ link_to like_name(likes.second), likes.second.user }"
        elsif num_likes == 3
          phrase << ", #{ link_to like_name(likes.second), likes.second.user } and 1 other person"
        else
          phrase << ", #{ link_to like_name(likes.second), likes.second.user } and #{ num_likes - 3 } other people"
        end
        phrase <<  " like this."
      end
    end

    phrase.html_safe
  end

  def like_name(like)
    if like.user == current_user
      "You"
    else
      like.user.full_name
    end
  end

end
