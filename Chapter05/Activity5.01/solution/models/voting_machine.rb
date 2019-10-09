class VotingMachine
  attr_reader :month, :year, :results

  class InvalidVote < Exception; end

  def initialize(month, year)
    @month = month
    @year = year
    @results = {}
  end

  def record_vote(voter, votee)
    raise InvalidVote unless valid_vote?(voter, votee)
    results[votee] ||= 0
    results[votee] += 1
  end

  def sorted_results
    results.sort_by(&:last).reverse
  end

  private
  def valid_vote?(voter, votee)
    # For now, the only logic is that you can't vote for yourself
    # However, this method allows future logic such as not allowing
    # multiple votes
    return false if [voter, votee].any?{|v| v.nil? || v == ""}
    voter.to_s.downcase != votee.downcase.to_s
  end
end
