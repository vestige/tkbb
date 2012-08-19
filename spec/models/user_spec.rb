require 'spec_helper'

describe User do
  describe '.find_or_create_by_omniauth' do
    subject { User.find_or_create_by_omniauth(auth) }
    let(:auth) do
      { 'provider'    => 'twitter',
        'uid'         => 'uid',
        'info'        => { 'name' => 'name' },
        'credentials' => { 'token'  => 'token',
                           'secret' => 'secret' } }
    end

    context 'find' do
      before { create :user, :provider => 'twitter', :uid => 'uid', :name => 'name' }
      it { should_not be_a_new(User) }

      its(:provider) { should eq 'twitter' }
      its(:uid) { should eq 'uid' }
      its(:name) { should eq 'name' }
    end

    context 'create' do
      it { should_not be_a_new(User) }

      its(:provider) { should eq 'twitter' }
      its(:uid) { should eq 'uid' }
      its(:name) { should eq 'name' }
      its(:token) { should eq 'token' }
      its(:secret) { should eq 'secret' }
    end
  end
end
