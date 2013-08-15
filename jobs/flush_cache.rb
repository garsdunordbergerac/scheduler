require 'dalli'

class FlushCache
  def self.run
    client = Dalli::Client.new([ENV['MEMCACHIER_SERVERS']], username: ENV['MEMCACHIER_USERNAME'], password: ENV['MEMCACHIER_PASSWORD'])
    client.flush_all
    puts 'cache flushed'
  end
end
