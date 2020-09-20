Vagrant.configure("2") do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder ".", "/vagrant", disabled: true	  

  config.vm.define "kubeapps" do |kube|
    kube.vm.box = "geerlingguy/ubuntu2004" 
    kube.vm.hostname = "kubeapps.test"
    kube.vm.network "private_network", ip: "192.168.60.10"
    kube.vm.provision "shell", path: "docker.sh"
    kube.vm.provision "shell", path: "helm.sh"
    kube.vm.provision "shell", path: "minikube.sh"
    kube.vm.provision "shell", path: "kubectl.sh"
    kube.vm.provision "shell", path: "kubeapps.sh"
  end

  # Para acceder al Dashboard de Kubeapps
  #config.vm.network "forwarded_port",
  #  guest: 8080,
  #  host:  8080,
  #  auto_correct: true   

  config.vm.provider "virtualbox" do |vb|
    vb.name = "kubeapps"
    vb.memory = "4096"
    vb.cpus = "2"
  end
end

