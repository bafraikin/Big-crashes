class DatasetController < ApplicationController
  include UserConnected
  
  def index
    @data = Dataset.all.sort
  end
  
  def crashes
    result = Dataset.sort_dataset(params[:id])
    @category = result[0] 
    @by_years = result[1]
  end
end
