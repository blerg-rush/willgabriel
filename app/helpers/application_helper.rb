module ApplicationHelper
  require "redcarpet"
  require "rouge"
  require "rouge/plugins/redcarpet"

  class MarkdownRenderer < Redcarpet::Render::HTML
    def initialize(extensions = {})
      super extensions.merge(link_attributes: { target: "blank" })
    end
    include Rouge::Plugins::Redcarpet
  end

  def markdown_text(text)
    Redcarpet::Markdown.new(MarkdownRenderer.new(hard_wrap: true),
                            fenced_code_blocks: true,
                            tables: true).render(text).html_safe
  end

  def date(sequence)
    sequence.strftime("%F")
  end

  def admin?
    session[:current_user]
  end
end
