module PostsHelper
  include ApplicationHelper

  def markdown_text(text)
    Redcarpet::Markdown.new(MarkdownRenderer.new(hard_wrap: true),
                            fenced_code_blocks: true,
                            tables: true).render(text).html_safe
  end
end
