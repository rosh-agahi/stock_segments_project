class Segment
attr_accessor :name, :percent, :url
@@all = []
  
  def initialize(name)
    @name = name
    @@all << self
    @stocks = []
  end

  def self.select_seg(index)
    @@all[index]
  end

  def add_stock(stock)
    @stocks << stock
  end

  def stocks 
    @stocks 
  end

  def print_stocks
    puts "Gain Percent | Ticker Symbol | Company"
    puts "--------------------------------------------------"
    self.stocks.each do |s|
    puts "#{s.percent}  |  #{s.ticker}  |  #{s.company}"
    end
  end

  def self.list
    @@all
  end

  def self.all 
    @@all.each_with_index do |i,index|
      puts "#{index+1}. #{i.name} #{i.percent}"
    end
  end

  def self.urls
    @@all.each_with_index do |i,index|
      puts "#{index+1}. #{i.name} #{i.url}"
    end
  end


end
