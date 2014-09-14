require 'rails_helper'

describe User do

  it { should have_many :posts }

  it { should have_many :followers }

  it { should have_many :following }

  it { should validate_presence_of :name }

  it { should validate_presence_of :handle }

  it { should validate_presence_of :email }

  it { should validate_presence_of :password }

  it { should validate_uniqueness_of :email }

end
