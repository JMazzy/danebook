module ApplicationHelper
  def friend_button(user)
    if user == current_user
      return
    end

    if !!current_user.initiated_friendings.find_by( friendee_id: user.id )
      link = link_to "Remove Friend", friending_path(id: user.id, friendee_id: user.id), method: :delete, class: "btn btn-default"
    else
      link = link_to "Add Friend", friendings_path(friendee_id: user.id), method: :post, class: "btn btn-primary"
    end

    link.html_safe
  end
end
