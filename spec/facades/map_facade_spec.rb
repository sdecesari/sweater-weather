require 'rails_helper'

RSpec.describe MapFacade do 
  it "returns a location poro", :vcr do 
    location = MapFacade.create_location("Denver,CO")
    expect(location).to be_a(Location)
  end 
end 