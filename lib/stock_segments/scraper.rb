require 'nokogiri'
require 'open-uri'

class SegmentScraper
attr_accessor :site, :doc, :sector, :sector_perc

  def initialize
    #nokigiri------
    @site = "https://markets.money.cnn.com/Marketsdata/Sectors"
    @doc = Nokogiri::HTML(open(site))
    @sector = doc.css("div#sectorPerformanceList").css("ul.nav.nav-pills.nav-stacked").css('li')
    @sector_perc = doc.css("div#sectorPerformanceList").css("ul.nav.nav-pills.nav-stacked").css('li').css("span.span-perc")

    sector.each do |item|
    segment_name = item.text.gsub(/(\+|\-).*/,"").strip
    Segment.new(segment_name)
    end  
  end

  def add_percents_and_url

      p_list = @sector_perc.collect do |p|
        p.text
      end
      Segment.list.each_with_index do |s,index|
        s.percent = p_list[index]
        s.url = "https://markets.money.cnn.com/Marketsdata/Sectors/#{s.name.delete(' ')}"
      end
  end
  
  def scrape_stocks
  Segment.list.each do |seg|
    site = seg.url
    doc = Nokogiri::HTML(open(site))

    table = doc.css(".sectorTopGainers")
    stocks = table.css("tr").drop(1)

      stocks.each do |s|
          percent = s.css('span.sectorDataGainPerc').text.ljust(11," ")
          ticker = s.css('a.sector_symbol').text.gsub(/\d|\W/,"").ljust(11," ")
          company = s.css('span:not(.sectorDataGainPerc)').text
          seg.stocks << Stock.new(ticker,company,percent)
      end
    end
  end

    
end