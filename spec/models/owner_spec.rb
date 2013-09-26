require 'spec_helper'

describe Owner do
  it { should have_many :buildings}
  

  it { should have_valid(:first_name).when('Bob', 'Tim') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Sagget', 'Allen') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:email).when('sagget1@gmail.com', 'tallen@aol.com') }
  it { should_not have_valid(:email).when('', nil, 'foo') }

  it { should have_valid(:company).when('Chuckie Cheese', 'Home Improvement') }
  
end
