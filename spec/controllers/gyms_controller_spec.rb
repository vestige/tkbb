require 'spec_helper'

describe GymsController do
  describe '#index' do
    let!(:akihabara) { create(:gym, name: 'Akihabara B-PUMP') }
    let!(:ogikubo) { create(:gym, name: 'Ogikubo B-PUMP') }
    let!(:shelter) { create(:gym, name: 'Shelter') }

    context 'with query' do
      before { get :index, :query => 'PUMP' }

      it { assigns[:gyms].should have(2).items }
    end

    context 'without query' do
      before { get :index }

      it { assigns[:gyms].should have(3).items }
    end
  end
end
