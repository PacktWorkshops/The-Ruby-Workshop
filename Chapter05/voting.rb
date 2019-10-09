#!/usr/bin/env ruby

# models/campaign.rb
class Campaign
  attr_accessor :month, :year

  def votes
    @votes ||= []
  end

  def winner
  end
end

# models/vote.rb
class Vote
  attr_accessor :sender, :receiver
end

class User
  attr_accessor :email, :votes
end
