require "bundler/gem_tasks"

require "cities-by-country"

require "pp"

namespace "cbc" do

  desc "Fetches all cities and all countries"
  task :fetch do
    countries = CitiesByCountry::Commands.all_cities

    pp countries
  end

end
