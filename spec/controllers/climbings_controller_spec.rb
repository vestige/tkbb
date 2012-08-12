require 'spec_helper'

describe ClimbingsController do
  subject { response }

  describe '#index' do
    let!(:climbings) { create_list :climbing, 2 }
    before { get :index }

    it { assigns(:climbings).should eq climbings }
  end

  describe '#new' do
    before { get :new }

    it { assigns(:climbing).should be_a_new(Climbing) }
  end

  describe 'create' do
    let!(:current_user) { create :user }
    let!(:gym) { create :gym }
    before { controller.stub(:current_user => current_user) }

    context 'with valid parameters' do
      before { post :create, :climbing => { :comment => 'My Comment', :gym_id => gym.id } }

      it { assigns(:climbing).should_not be_a_new(Climbing) }
      it { assigns(:climbing).user.should eq current_user }
      it { should redirect_to climbings_path }
    end
  end
end
