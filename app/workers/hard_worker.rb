class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    puts "complete!"
  end
end
