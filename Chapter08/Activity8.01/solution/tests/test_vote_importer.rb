require "minitest/autorun"
require 'minitest/stub_any_instance'
require_relative "../services/vote_importer"
class TestVoteImporter < Minitest::Test
  def test_perform
    # Import votes data from our tests/fixtures/votes.csv file
    filepath = 'tests/fixtures/votes.csv'
    results = VoteImporter.perform(filepath)
    assert_equal results.length, 2
    assert_equal results.map{|k,v| k}.include?("VoteCategoryA"), true
    assert_equal results.map{|k,v| k}.include?("VoteCategoryB"), true
  end
end
