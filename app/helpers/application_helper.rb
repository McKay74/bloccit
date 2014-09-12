module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = { fenced_code_blocks: true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def up_vote_link_classes(post)
    vote = current_user.voted(post)
    string = "glyphicon glyphicon-chevron-up "
    string += "voted" if vote && vote.up_vote?
    string
  end

  def down_vote_link_classes(post)
    vote = current_user.voted(post)
    string = "glyphicon glyphicon-chevron-down "
    string += "voted" if vote && vote.down_vote?
    string
  end

end
