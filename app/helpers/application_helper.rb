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

  def date(sequence)
    sequence.strftime("%F")
  end
end
