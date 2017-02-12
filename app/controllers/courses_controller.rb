class CoursesController < ApplicationController
  def index
  	@search_term = params[:looking_for] || 'game'
  	@courses = Coursera.for(@search_term)
  end
end
