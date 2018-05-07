# Service that takes care of all our interactions with contests within this rails app.
# This class is inititalized with a Contest class or a Contest Object.
# This service could easily be ported to it's own gem/engine to keep the rails
# app from getting muddy.
class ContestService

  attr_reader :contest

  def initialize(contest = Contest)
    # Contest can be anything but in this case its typically an AR class in
    # Rails, but it could be something else. The ContestService doesn't really
    # care or know what it is. It can also be an Object.
    @contest = contest
  end

  def all
    contest.all
  end

  def find(id)
    contest.includes(:contest_pets).find(id)
  end

  def create(options = {})
    # Persist our contest so that we can queue it up
    new_contest = contest.create(options)

    # We are waiting a bit here only to simulate a lot of pets trying to get into
    # the arena to do battle. That way we could actually view status changes.
    # This job will call the battle method below
    ContestBattleJob.set(wait: 30.seconds).perform_later(new_contest)

    new_contest
  end

  # async only! battle should always be called from a job
  def battle
    # Update the contest status
    contest.batteling!

    # The Arena::Contest gem is stateless. It doesn't care about our arena
    # api state or the battle pets api. All it cares about is figuring out the winner
    winner_id = Arena::Contest.determine_winner(contest.contest_type, fetch_pets_to_battle)

    update_winner winner_id
  end

  private

  def fetch_pets_to_battle
    # BattlePets is a gem that is used to talk to our pet mgmt api.
    # We store the pets ids in the arena api on a Contest -> ContestPet but we
    # don't want to replicate all their attributes here, that would be silly. So
    # lets grab them now from the BattlePets API
    pets_client = BattlePets::Client.new
    pets = []

    contest.contest_pets.each do |pet|
      pets << pets_client.find(pet.pet_uid)
      # We could create a Thread around all this and then loop the calls to our
      # API, but since battle gets called from an async job anyways this will
      # work fine for now. We want to be nice to our little Scala API. We could
      # move proper throttle ctrl into our BattlePets::Client
      sleep 3
    end

    pets
  end

  def update_winner(winner_id)
    contest.update_attributes(
      winner_id: winner_id,
      finished_at: DateTime.now,
      status: 'finished'
    )
  end
end
