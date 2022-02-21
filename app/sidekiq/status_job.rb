class StatusJob
  include Sidekiq::Job

  def perform(*args)
    puts 'checking job processing'
  end
end
