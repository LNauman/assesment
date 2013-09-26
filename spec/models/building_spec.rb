require 'spec_helper'

describe Building do
  

  it { should have_valid(:street_address).when('1311 South Street', '309 South Street') }
  it { should_not have_valid(:street_address).when('', nil) }

  it { should have_valid(:city).when('Philadelphia', 'Cambridge') }
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('PA', 'MA') }
  it { should_not have_valid(:state).when('', nil) }

  it { should have_valid(:postal_code).when(19147, 53241) }
  it { should_not have_valid(:postal_code).when(0, nil, 'notazip') }

  it { should have_valid(:description).when('Hardwood floors!', 'Terrible smell.') }

end
