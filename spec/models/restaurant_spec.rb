require 'spec_helper'

describe Restaurant do 
  it {should validate_presence_of :name}
end