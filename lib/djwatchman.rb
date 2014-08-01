require "djwatchman/version"

module Djwatchman
  class DelayedJobMonitor
    def self.run
      begin
        count = Delayed::Job.where("created_at < ?", (ENV['DJWATCHMAN_MINUTES'] || 60).minutes.ago).count
        if count > 0
          raise "There are #{count} unprocessed delayed jobs."
        end
      rescue Exception => e
        puts e.inspect
        puts e.backtrace.inspect
        Airbrake.notify(e, {error_message: "#{e.message}"})
      end
    end
  end
end
