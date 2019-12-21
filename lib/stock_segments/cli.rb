class StockSegments::CLI

  def initialize
    puts "Welcome to today's daily review of stock performance!"
    puts "Please wait one moment while a list of stock segments is compiled..."
    puts "Due to limited information, a review of stocks for the Real Estate category is not available."
    puts ""
    menu_loop
    puts "Thanks for checking in today!"
  end

  def menu_loop
     a = SegmentScraper.new
     a.add_percents_and_url
     a.scrape_stocks
     puts "Here's the list of stock segments, listed with the best performing segments first:"
     puts ""
     Segment.all
     puts ""
     puts "Type 1-11 to explore the 5 top performing stocks in that segment"
     puts "Type r to return to list and e to exit"

     loop do
      input = gets.chomp

      case input
      when 'r'
        puts "Here is the list again:"
        Segment.all
        puts ""
        puts "Type 1-11 to explore stocks, r to return to list and e to exit"

      when '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11'
        index = input.to_i-1
        segmnt = Segment.select_seg(index)
        puts ""
        puts segmnt.name
        segmnt.print_stocks
        puts ""
        puts "You can select another segment, use r to return to list and e to exit"

      when 'e'
        break

      else
        puts ""
        puts "Your entry is invalid. Type 1-11 to explore stocks, r to return to list and e to exit."
      end
    end
  end
end