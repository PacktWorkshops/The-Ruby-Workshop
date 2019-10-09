require "csv"
class CSVPrinter
  def initialize(filepath)
    @filepath = filepath
  end

  def perform
    CSV.foreach(@filepath) do |row|
      puts row.to_s
    end
  end
end