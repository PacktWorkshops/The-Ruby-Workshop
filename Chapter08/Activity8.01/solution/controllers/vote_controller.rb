class VoteController < Controller
  attr_accessor :voter, :votee, :category

  def run
    log "You can vote for: #{self.voting_machine.categories.join(", ")}"
    get_input :category, "Which category would you like to vote for? "
    get_input :voter, "What's your name? "
    get_input :votee, "Who do you want to vote for? "

    self.voting_machine.record_vote(@category, @voter, @votee)

    log "Vote recorded!"
    log_to_file("Vote recorded - Voter: #{@voter} Votee: #{@votee} Category: #{@category}", "info")
  end
end
