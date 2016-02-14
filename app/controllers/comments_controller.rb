class CommentsController < ApplicationController
  def index
    @comments = extract_commentable.comments
  end
  private
  def extract_commentable
    resource, id = request.path.split('/')[1,2]
    resource.singularize.classify.constantize.find(id)
  end
end
