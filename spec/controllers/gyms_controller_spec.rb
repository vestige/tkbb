require 'spec_helper'

describe GymsController do
  describe '#index' do
    let!(:akihabara) { create(:gym, :name => 'Akihabara B-PUMP') }
    let!(:ogikubo) { create(:gym, :name => 'Ogikubo B-PUMP') }
    let!(:shelter) { create(:gym, :name => 'Shelter') }

    context 'with query' do
      before { get :index, :query => 'PUMP' }

      it { assigns[:gyms].should have(2).items }
    end

    context 'without query' do
      before { get :index }

      it { assigns[:gyms].should have(3).items }
    end
  end

  describe '#show' do
    let!(:gym) { create :gym }
    before { get :show, :id => gym.id }

    it { assigns[:gym].should eq gym }
  end

  describe '#new' do
    before { get :new }

    it { assigns[:gym].should be_a_new(Gym) }
  end

  describe '#edit' do
    let!(:gym) { create :gym }
    before { get :edit, :id => gym.id }

    it { assigns[:gym].should eq gym }
  end

  describe '#create' do
    before { post :create, :gym => { :name => 'My Gym', :latitude => 10, :longitude => 10 } }

    it { assigns[:gym].should_not be_a_new(Gym) }
    it { should redirect_to gym_path(assigns[:gym]) }
  end

  describe '#update' do
    let!(:gym) { create :gym }
    before { put :update, :id => gym.id, :gym => { :name => 'Updated Gym' } }

    it { assigns[:gym].name.should eq 'Updated Gym' }
  end

  describe '#destroy' do
    let!(:gym) { create :gym }
    before { delete :destroy, :id => gym.id }

    it { should redirect_to gyms_url }
    it { Gym.find_by_id(gym.id).should be_nil }
  end

end
