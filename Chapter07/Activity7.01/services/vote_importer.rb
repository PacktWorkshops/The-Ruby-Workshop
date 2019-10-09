require 'csv'
class VoteImporter
  def initialize(filepath)
    @filepath = filepath
  end

  def perform
    results = {}
    CSV.read(@filepath, headers: true).each do |row|
      results[row["category"]] ||= {}
      results[row["category"]][row["votee"]] = row["count"].to_i
    end
    results
  end

  def self.perform(*args)
    new(*args).perform
  end
end