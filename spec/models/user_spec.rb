require 'rails_helper'

describe User do

  it { should have_many :posts }
  it { should have_many :followers }
  it { should have_many :following }
  it { should have_many :things }

end
