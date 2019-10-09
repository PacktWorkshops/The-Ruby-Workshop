class LeaderboardController < Controller
  def run
    sorted_results = voting_machine.sorted_results
    tables = VoteTable.perform(sorted_results)
    tables.each do |table|
      log table
    end
  end
end
