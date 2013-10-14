class Building < ActiveRecord::Base
  belongs_to :owner,
    inverse_of: :buildings

  STATES = ['', 'AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 
            'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 
            'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 
            'MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY', 
            'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 
            'UT', 'VA', 'VT', 'WA', 'WI', 'WV', 'WY']

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  # I didn't realize we needed to make a feature branch for the first part
  # of the assignment so I had to add this comment to make a change
  # so the files would be different and I could actually issue a pull request.
  # The assignment is just in the reqular repo, I will make a feature branch 
  # for the second phase of the exam.
  
  validates_length_of :postal_code,
    :minimum => 5, :maximum => 5, allow_blank: false

  # validates_numericality_of :postal_code, 
  #   allow_blank: false, 
  #   only_integer: true,
  #   greater_than_or_equal_to: 10000,
  #   less_than_or_equal_to: 99999

  validates_inclusion_of :state, in: STATES

end
