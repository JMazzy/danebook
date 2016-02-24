module StoriesHelper

  def render_story(story)
    if story.subject_type == "Post" || story.subject_type == "Photo"
      render partial: "#{story.subject_type.downcase.pluralize}/view", locals: { story.subject_type.downcase.to_sym => story.subject }
    end
  end
end
