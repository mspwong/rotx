require 'rotatable'

describe Rotatable do
  describe '#rotx' do
    it "encrytion" do
      result = rotx 10, 'Hello, World'
      result.should == 'Rovvy, Gybvn'
    end

    it "decryption" do
      result = rotx 10, 'Rovvy, Gybvn', :decrypt
      result.should == 'Hello, World'
    end

    it "positions greater than 26 " do
      result = rotx 36, 'Hello, World'
      result.should == 'Rovvy, Gybvn'
    end

    it "positions of zero does not alter string" do
      result = rotx 0, 'Hello, World'
      result.should == 'Hello, World'
    end

    it "raises argument error if cipher is invalid" do
      lambda { rotx 10, 'Hello, World', :bogus_cipher }.should raise_error(ArgumentError)
    end

    it "raises argument error if positions is negative" do
      lambda { rotx -1, 'Hello, World' }.should raise_error(ArgumentError)
    end

    it "raises argument error if positions is not an integer" do
      lambda { rotx 'bogus', 'Hello, World' }.should raise_error(ArgumentError)
    end
  end
end