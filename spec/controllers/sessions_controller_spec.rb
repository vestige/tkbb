require 'spec_helper'

describe SessionsController do
  describe '#create' do
    let(:omniauth_params) do
      { 'omniauth.auth' =>
            { 'provider'    => 'twitter',
              'uid'         => 'uid',
              'info'        => { 'name' => 'name' },
              'credentials' => { 'token'  => 'token',
                                 'secret' => 'secret' } } }
    end
    before { request.stub(:env => omniauth_params) }

    context 'with user' do
      let!(:user) { create :user, :provider => 'twitter', :uid => 'uid' }

      before { post :create, :provider => 'twitter' }

      it { session[:user_id].should eq user.id }
      it { redirect_to root_url }
    end

    context 'without user' do
      before { post :create, :provider => 'twitter' }

      it { User.where(:provider => 'twitter').where(:uid => 'uid').should be_exists }
      it { redirect_to root_url }
    end
  end

  describe '#destroy' do
    before { session[:user_id] = 1 }

    before { get :destroy }
    it { session[:user_id].should be_nil }
    it { redirect_to root_url }
  end
end
