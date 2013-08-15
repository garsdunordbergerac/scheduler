$LOAD_PATH.unshift(File.expand_path(__FILE__))

require 'clockwork'
require 'rake'

include Clockwork

handler do |job|
  puts "Running #{job}"
  require "./jobs/#{job}"
  job.camelize.constantize.run
end

every(1.day, 'flush_cache', at: '03:00')
