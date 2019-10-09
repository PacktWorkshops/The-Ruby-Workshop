class VotingMachine
  attr_reader :month, :year, :results, :categories

  class InvalidCategory < Exception; end
  class InvalidVote < Exception; end

  def initialize(month, year)
    @month = month
    @year = year
    @categories = []
    @results = {}
  end

  def import_votes(filepath)
    @results = VoteImporter.perform(filepath)
  end

  def add_category(category)
    @categories << category
    @categories.uniq! # make sure no duplicates
  end

  def record_vote(category, voter, votee)
    raise InvalidCategory unless valid_category?(category)
    raise InvalidVote unless valid_vote?(voter, votee)
    results[category] ||= {}
    results[category][votee] ||= 0
    results[category][votee] += 1
  end

  def sorted_results
    results.map{|k, v| {k => v.sort_by(&:last).reverse}}
  end

  private
  def valid_vote?(voter, votee)
    # For now, the only logic is that you can't vote for yourself
    # However, this method allows future logic such as not allowing
    # multiple votes
    return false if [voter, votee].any?{|v| v.nil? || v == ""}
    voter.to_s.downcase != votee.downcase.to_s
  end

  def valid_category?(category)
    categories.include?(category) ? true : false
  end
end
