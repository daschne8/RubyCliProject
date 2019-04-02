require_relative '../lib/destination.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/cli.rb'

require 'pry'

cli = CLI.new
cli.run

doc = Scraper.return_doc
binding.pry
