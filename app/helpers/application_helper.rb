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

  def sign_in(user)
    user.regenerate_auth_token
    cookies[:auth_token] = user.auth_token
    @current_user = user
  end

  # If we need to remember the user
  def permanent_sign_in(user)
    user.regenerate_auth_token
    cookies.permanent[:auth_token] = user.auth_token
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:auth_token)
  end

  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path  #< Remember this is a custom route
    end
  end

  def require_logout
    if signed_in_user?
      flash[:error] = "You must sign out to do that!"
      redirect_to user_path(current_user)
    end
  end

  def require_current_user
    unless params[:id] == current_user.id.to_s || params[:user_id] == current_user.id.to_s
      flash[:error] = "You're not authorized to do that!"
      redirect_to :back
    end
  end

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def signed_in_user?
    !!current_user
  end

  def navbar_forms
    if signed_in_user?
      render 'layouts/search_form'
      render 'layouts/sign_out_form'
    else
      render 'layouts/sign_in_form'
    end
  end
end
