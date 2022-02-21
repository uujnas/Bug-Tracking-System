class FirstJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    puts 'Hello, welcome to active job'
  end
end
