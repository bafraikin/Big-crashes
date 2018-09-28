class HomeController < ApplicationController
  def index
    @data = Dataset.all.sort
  end
end
