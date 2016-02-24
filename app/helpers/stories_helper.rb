module StoriesHelper

  def render_story(story)
    render partial: "#{story.subject_type.downcase.pluralize}/view", locals: { story.subject_type.downcase.to_sym => story.subject }
  end
end
