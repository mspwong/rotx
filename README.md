Expectations:

rotx 10, 'Hello, World'
# => "Rovvy, Gybvn"
rotx 10, 'Rovvy, Gybvn', :decrypt
# => "Hello, World"

# rotation numbers greater than 26 should work as well
rotx 36, 'Hello, World'
# => "Rovvy, Gybvn"