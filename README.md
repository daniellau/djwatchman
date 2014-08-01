# Djwatchman

A simple watcher that checks your delayed job list every hour and alerts you if your jobs haven't gone through.

## Installation

Add this line to your application's Gemfile:

    gem 'djwatchman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install djwatchman

## Usage

The default length of time that checks for unsent delayed jobs is 60 minutes. You can set a custom amount of time by setting `DJWATCHMAN_MINUTES=30` in your environment.

## Example of schedule.rb


    set :output, "/path/to/your/cron.log"

    case @environment
      when 'production'
        every :hour do
          runner "DelayedJobMonitor.run"
        end
      else
        every 12.months, :at => '8:00 am' do
          runner "puts 'No (whenever gem) cron jobs for #{@environment}.'"
        end
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
