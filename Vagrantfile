Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'upeweb.local'

  # Forward SSH and Django ports
  config.vm.network 'forwarded_port', guest: 22, host: 20022, id: 'ssh'
  config.vm.network 'forwarded_port', guest: 8000, host: 20080, id: 'http'

  # Allow host-only access to machine
  config.vm.network 'private_network', ip: '192.168.55.55'

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'UPE webdev'
    vb.gui = false
    vb.memory = 1024
    vb.cpus = 2
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
  end

  # Install puppet vcsrepo module
  config.vm.provision :shell do |shell|
    shell.inline = "mkdir -p /etc/puppet/modules; puppet module install --force puppetlabs/vcsrepo"
  end

  # Setup using Puppet
  config.vm.provision 'puppet' do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path= 'puppet/modules'
    #puppet.manifest_file  = 'site.pp'
    puppet.options = [ '--verbose' ]
  end
end
