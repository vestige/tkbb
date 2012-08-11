require 'spec_helper'

describe User do
  describe 'create_with_omniauth' do
    let(:auth) do
      { 'provider'    => 'twitter',
        'uid'         => 'uid',
        'info'        => { 'name' => 'name' },
        'credentials' => { 'token'  => 'token',
                           'secret' => 'secret' } }
    end
    subject { User.create_with_omniauth(auth) }

    it { should_not be_a_new(User) }
    its(:provider) { should eq 'twitter' }
    its(:uid) { should eq 'uid' }
    its(:name) { should eq 'name' }
    its(:token) { should eq 'token' }
    its(:secret) { should eq 'secret' }
  end
end
