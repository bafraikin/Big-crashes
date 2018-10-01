class DatasetController < ApplicationController
  def crashes

    crashs = Dataset.find(params[:name]).crashes.map { | crash | [crash.date, crash.localisation, crash.source.name, crash.identifier]}
    @by_years = {}
    crashs.each do |crash|
      @by_years[crash[0].strftime("%Y")] = [] if @by_years[crash[0].strftime("%Y")] == nil
      @by_years[crash[0].strftime("%Y")] << crash
    end
  end
end
