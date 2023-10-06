echo "Install required packages"
sudo apt-get install -y apt-transport-https ca-certificates curl
echo "Install k8s GPG"
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo "Add k8s to repo"
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/k8s.list
echo "Install kubelet, kubeadm, kubectl"
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

echo "Create module"
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF
echo "Load module"
modprobe overlay br_netfilter

echo "Create rule"
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

echo "Apply rule"
sudo sysctl --system

echo "Install docker"
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker.gpg
cat <<EOF | sudo tee /etc/apt/sources.list.d/docker.list
deb [arch=amd64] https://download.docker.com/linux/debian bookworm stable 
EOF
sudo apt-get update
sudo apt-get install -yq docker-ce docker-ce-cli containerd.io

echo "Install cri-dockerd" 
echo https://github.com/Mirantis/cri-dockerd/releases
wget 'https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.4/cri-dockerd_0.3.4.3-0.ubuntu-jammy_amd64.deb'
sudo dpkg -i 'cri-dockerd_0.3.4.3-0.ubuntu-jammy_amd64.deb'

echo "Pull k8s images"
sudo kubeadm --cri-socket 'unix:///var/run/cri-dockerd.sock' config images pull

echo "Install Helm"
curl -fsSL 'https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3' -o get_helm.sh
chmod 500 get_helm.sh
./get_helm.sh

echo "Install k9s"
curl -fsSL 'https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz' -o k9s.tar.gz
tar -xf k9s.tar.gz
chmod 555 k9s
sudo cp k9s /usr/bin/.

echo "Init kube cluster"
sudo kubeadm init --control-plane-endpoint `hostname` \ 
  --cri-socket unix:///var/run/cri-dockerd.sock \
  --pod-network-cidr=10.244.0.0/16

echo "Config kubectl"
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

echo "Install flannel"
curl -fsSL 'https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml' -o kube-flannel.yml
kubectl apply -f kube-flannel.yml

