require 'spec_helper'

describe WelcomeController do
  subject { response }

  describe '#index' do
    it 'responses success status' do
      get :index
      should be_success
    end
  end
end
