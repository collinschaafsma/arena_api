require "spec_helper"

describe BattlePets::Pet do
  subject {
    described_class.new({
      'id' => '123',
      'name' => 'Heidi',
      'strength' => 12,
      'speed' => 21,
      'intelligence' => 30,
      'integrity' => 10
      })
  }

  it { expect(subject).to have_attributes(id: '123') }
  it { expect(subject).to have_attributes(name: 'Heidi') }
  it { expect(subject).to have_attributes(strength: 12) }
  it { expect(subject).to have_attributes(speed: 21) }
  it { expect(subject).to have_attributes(intelligence: 30) }
  it { expect(subject).to have_attributes(integrity: 10) }
  it { expect(subject).not_to have_attributes(name: 'Thug') }

end
