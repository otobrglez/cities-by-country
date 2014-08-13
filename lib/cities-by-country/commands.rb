require 'nokogiri'
require 'open-uri'

class CitiesByCountry::Commands
  WIKI_BASE_URI = "http://en.wikipedia.org"
  WIKI_COUNTRIES_URL="#{WIKI_BASE_URI}/wiki/Lists_of_cities_by_country"

  def self.countries
    doc = Nokogiri::HTML open(WIKI_COUNTRIES_URL)

    countries = {}
    doc.search("//a[contains(@href,'/List_of_cities')]").each do |a|
      name = a.content.gsub(/List of cities in /,"").gsub(/^the /,"")
      slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')

      countries[slug] = {
        name: name,
        slug: slug,
        href: a["href"]
      }
    end

    countries
  end

  def self.cities slug, details={}
    #TODO: Put some magic here
  end

  def self.all_cities
    countries.each do |slug, details|
      cities slug, details
    end
  end
end
