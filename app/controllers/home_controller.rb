class HomeController < ApplicationController
  def index
    @data = Dataset.all.sort
  end

  def by_year
    @data = Dataset.all.sort
  end
end
