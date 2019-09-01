class PagesController < ActionController::Base
  def index
    render file: 'public/docs/v1.html'
  end
end
