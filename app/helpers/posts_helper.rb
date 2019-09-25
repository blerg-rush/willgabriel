module PostsHelper
  include ApplicationHelper

  def markdown_text(text)
    Redcarpet::Markdown.new(MarkdownRenderer,
                            fenced_code_blocks: true,
                            tables: true).render(text).html_safe
  end
end
