class Stock
attr_accessor :ticker, :company, :percent

  def initialize(ticker,company,percent)
    @ticker = ticker
    @company = company
    @percent = percent
  end

end