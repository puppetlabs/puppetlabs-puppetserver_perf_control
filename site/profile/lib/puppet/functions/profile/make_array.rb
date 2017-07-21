Puppet::Functions.create_function(:'profile::make_array') do
  dispatch :size do
    param 'Numeric', :some_size
  end

  def size(some_size)
    (0..some_size).to_a
  end
end
