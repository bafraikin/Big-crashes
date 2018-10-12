class HomeController < ApplicationController

  def by_year
    @data = Dataset.all.sort
  end
end
