class HomeController < ApplicationController
  def index
    @data = Dataset.all
  end
end
