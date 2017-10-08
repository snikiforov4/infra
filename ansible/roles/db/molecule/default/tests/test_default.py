import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')

def test_mongod_running_and_enabled(host):
    mongod = host.service("mongod")
    assert mongod.is_running
    assert mongod.is_enabled

def test_mongod_config_exists_and_has_right_permissions(host):
    config_file = host.file('/etc/mongod.conf')
    assert config_file.exists
    assert config_file.is_file
    assert oct(config_file.mode) == '0644'

def test_mongod_config_has_correct_props(host):
    config_file = host.file('/etc/mongod.conf')
    assert config_file.contains('port: 27017')
    assert config_file.contains('bindIp: 0.0.0.0')

def test_mongod_listening_by_specified_port(host):
    host.socket("tcp://:::27017").is_listening
