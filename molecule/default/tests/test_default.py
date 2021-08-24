import testinfra.utils.ansible_runner

def test_packages(host):
  package = host.package('certbot')
  assert package.is_installed

def test_acme_directory(host):
  path = host.file('/var/www/acme')
  assert path.exists
  assert path.is_directory
  assert path.user == 'root'
  assert path.group == 'root'
  assert path.mode == 0o755

def test_old_cron_file(host):
  path = host.file('/etc/cron.d/certbot')
  assert not path.exists

def test_cron_file(host):
  path = host.file('/var/spool/cron/crontabs/root')
  assert path.exists
  assert path.is_file
  assert path.user == 'root'
  assert path.group == 'crontab'
  assert path.mode == 0o600
  assert path.contains('--renew-hook /usr/local/bin/certbot-renew')

def test_config_file(host):
  path = host.file('/etc/letsencrypt/renew.cfg')
  assert path.exists
  assert path.is_file
  assert path.user == 'root'
  assert path.group == 'root'
  assert path.mode == 0o644
  assert path.contains('test.local = echo OK > /tmp/test.txt')

def test_renew(host):
  cmd = host.run('RENEWED_DOMAINS=test.local /usr/local/bin/certbot-renew')
  assert cmd.succeeded

  path = host.file('/tmp/test.txt')
  assert path.exists
  assert path.is_file
  assert path.contains('OK')
