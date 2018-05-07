class ContestBattleJob < ApplicationJob
  queue_as :default

  def perform(contest)
    # This calls our contest service, our ContestService is responsible
    # for all interactions when it comes to Contests in Rails land
    ContestService.new(contest).battle
  end
end
