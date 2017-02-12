class GreeterController < ApplicationController
  def hello
  	randon_names = ["Alex", "Joe", "Michael"]
  	@name = randon_names.sample
  	@time = Time.now
  	@times_displayed ||= 0
  	@times_displayed += 1
  end
  def goodbye
  end
end
