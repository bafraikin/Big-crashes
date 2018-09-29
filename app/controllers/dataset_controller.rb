class DatasetController < ApplicationController
  def crashes
    @crashs = Dataset.find(params[:name]).crashes.map { | crash |  [crash.date, crash.localisation, crash.source.name, crash.identifier]}
  end
end
