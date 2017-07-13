# -*- mode: ruby -*-
# vi: set ft=ruby :

options = {
  :project => 'ss',
  :project_short_name => 'ss',
  :aliases => [],
  :memory => "2048",
  :debug => false
}

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"

  config.vm.network "private_network", ip: "10.10.10.10"
  config.ssh.forward_agent = true

  config.vm.synced_folder "./", "/vagrant", type: "nfs", mount_options: ['rw', 'vers=3', 'tcp']

  config.vm.define options[:project]
  config.vm.hostname = options[:project] + ".dev"

  if options[:aliases].any?
    config.hostsupdater.aliases = []
    for host in options[:aliases]
      config.hostsupdater.aliases.push(host + '.dev')
    end
  end

  config.vm.provider "virtualbox" do |vb|
    vb.name = options[:project]
    vb.memory = options[:memory]
  end
end
