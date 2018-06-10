require 'serverspec'

set :backend, :exec

describe package('certbot') do
  it { should be_installed }
end

describe file('/var/www/acme') do
  it { should exist }
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end
