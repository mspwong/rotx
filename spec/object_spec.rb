require 'object'

describe '#rotx' do
  it "'Hello, World' ==> 'Rovvy, Gybvn'" do
    result = rotx 10, 'Hello, World'
    result.should == 'Rovvy, Gybvn'
  end

  it "'Rovvy, Gybvn' ==> 'Hello, World'" do
    result = rotx 10, 'Rovvy, Gybvn', :decrypt
    result.should == 'Hello, World'
  end

  it "'Hello, World' ==> 'Rovvy, Gybvn'" do
    result = rotx 36, 'Hello, World'
    result.should == 'Rovvy, Gybvn'
  end

  it "raises argument error if cipher is invalid"

  it "raises argument error if string contains non-alpha characters"

  it "raises argument error if rotation number is negative"

end