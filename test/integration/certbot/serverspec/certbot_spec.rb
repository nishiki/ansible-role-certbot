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

describe file('/etc/cron.d/certbot') do
  it { should_not exist }
end

describe file('/var/spool/cron/crontabs/root') do
  it { should exist }
  it { should be_file }
  it { should be_mode 600 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'crontab' }
  it { should contain '--renew-hook /usr/local/bin/certbot-renew' }
end

describe file('/etc/letsencrypt/renew.cfg') do
  it { should exist }
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
  it { should contain 'test.local = echo OK > /tmp/test.txt' }
end

describe command('RENEWED_DOMAINS=test.local /usr/local/bin/certbot-renew') do
  its(:exit_status) { should eq 0 }
end

describe file('/tmp/test.txt') do
  it { should exist }
  it { should be_file }
  it { should contain 'OK' }
end
