class SiteController < ApplicationController
  def show
    @readme = renderer.render(File.read(file))
  end

  private

  def renderer
    Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end

  def file
    Rails.root.join("README.md")
  end
end
