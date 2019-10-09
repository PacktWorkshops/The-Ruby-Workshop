require "minitest/autorun"
require 'minitest/stub_any_instance'
require_relative "../services/vote_table"
require_relative "../services/vote_importer"
class TestVoteTable < Minitest::Test
  def test_perform
    # Import votes data from our tests/fixtures/votes.csv file
    filepath = 'tests/fixtures/votes.csv'
    results = {"VoteCategoryA"=>[["Susie Bennet", 29]]},{"VoteCategoryB"=>[["Allan Green", 33]]}
    tables = VoteTable.perform(results)
    assert_equal tables.length, 2
    tables.each do |table|
      assert_equal table.class, Terminal::Table
      assert_equal table.title.include?("VoteCategory"), true
    end
  end
end
