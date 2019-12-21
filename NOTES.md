# About the project
Similar stocks are grouped by category - or segment - like Healthcare, Info Tech, Real Estate, etc. This app scrapes the daily movements of the 11 segments listed on CNN Business and allows the user to dive into each segment to see the top 5 performing stocks in each segment.

# Flow
## User experience
User starts app and immediately all 11 stock segments are listed from CNN Business.
The user is then prompted to select 1-11 to further investigate within the stock segments
The user can also press 'e' to exit or when they are inside a specific segment they can press 'r' to return to the list of segments.


# Classes
A class is a collection of similar object instances. For this app there are 4 classes: the CLI app class, the Scraper, Stock Segments, and Stocks.

## CLI app
  This class holds sequence of actions to be looped within the app. 
  This class is the interface.
  _Using namespacing when referring to the class name provides protection to the user if they are running your program simultaneously with another program that has classes with a similar name. By including the "StockSegments::" at the beginning of the class name, it specifies that these classes are designated to this app/gem and won't override, for instance, the CLI class of the other program the users might have open._
  
  **CLI Methods**
  
  _Initialize_
  This method initializes an instance of the CLI app which is the user interface for the app. Each instance is one run of the app.
  _menu loop_
  The loop allows the user to make selections and investigate stocks and segment performance until they choose to exit the app.
  
## Scraper
  The scraper initializes and uses Nokogiri to scrape data from CNN Business 
  The scraper has a method to scrape stock data for each of the segments 
  
  **Scraper Methods**
  
  _Initialize_
  At the start of the app, a Scraper is initialized and it scrapes all of the stock segments and stocks within each of those segments, creating instances of both classes
  _Add Percents and URLs_
  _Scrape Stocks_
  
  
  
## Stock Segment (aka Segment)
  A segment is an umbrella category that is representative of like stocks. For the purposes of this app, a segment has the following attributes: an index number for selection, a name that is representative of its category, and a percentage gain in value from the previous day. The name and percent gain are scraped from the CNN Business website.
  **Segment Methods**
  _Initialize_
  
  
## Stock 
  Stocks are individual shares of a company that are sold by a company in return for money to invest in their business. In this app, a stock has a ticker symbol which is its identification on the stock market, a company to which it belongs, and a percentage gain in value from the previous day.
  **Stock Methods**
  _Initialize_ -