module UsersHelper

  def show_content(user, tab_name)
    render partial: 'layouts/tabs', locals: { user: user, selected: tab_name }

    case tab_name
    when :timeline
      render 'timeline_page', locals: { user: user, posts: user.sorted_posts }
    when :about
      render 'about_page', locals: { user: user, profile: user.profile }
    when :friends
      render 'friends_page', locals: { user: user, friends: user.friends }
    when :photos
      render 'photos_page', locals: { user: user, photos: user.photos }
    end
  end

end
