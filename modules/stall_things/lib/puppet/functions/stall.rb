# Put this in a module at <MODULE>/lib/puppet/functions/stall.rb
Puppet::Functions.create_function(:stall) do
  dispatch :stall do
    param 'Numeric', :seconds
  end

  def stall(n)
    sleep n
    "dummy return value"
  end
end
