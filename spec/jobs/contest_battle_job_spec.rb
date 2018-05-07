require 'rails_helper'

RSpec.describe ContestBattleJob, type: :job do
  ActiveJob::Base.queue_adapter = :test

  subject(:job) { described_class.set(wait: 30.seconds).perform_later(contest) }

  let(:contest) { create(:contest_with_contest_pets) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .with(contest)
      .on_queue("default")
  end
end
