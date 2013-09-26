class Building < ActiveRecord::Base
  STATES = ['', 'AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 
            'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 
            'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 
            'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 
            'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 
            'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY']

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  #sdfsfs
  

  validates_numericality_of :postal_code, 
    allow_blank: false, 
    only_integer: true,
    greater_than_or_equal_to: 10000,
    less_than_or_equal_to: 99999

  validates_inclusion_of :state, in: STATES

end
