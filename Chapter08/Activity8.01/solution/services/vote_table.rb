require 'terminal-table'
class VoteTable
  def initialize(sorted_votes)
    @sorted_votes = sorted_votes
  end

  def perform
    headings = ['Votee', 'Count']
    tables = []
    @sorted_votes.each do |votes|
      tables << Terminal::Table.new(rows: votes.values[0], title: votes.keys[0], headings: headings)
    end
    tables
  end

  def self.perform(*args)
    new(*args).perform
  end
end