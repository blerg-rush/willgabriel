module PostsHelper
  include ApplicationHelper

  def show_page?
    !params[:id].nil?
  end
end
