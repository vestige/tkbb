require 'spec_helper'

describe Gym do
  describe '.search' do
    let(:akihabara) { create(:gym, name: 'Akihabara B-PUMP') }
    let(:ogikubo) { create(:gym, name: 'Ogikubo B-PUMP') }

    subject { Gym.search('Akihabara').all }
    it { should eq [akihabara] }
  end
end
