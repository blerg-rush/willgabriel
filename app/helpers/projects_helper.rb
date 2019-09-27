module ProjectsHelper
  def show_page?
    !params[:id].nil?
  end
end
