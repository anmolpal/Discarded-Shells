#!/bin/sh
if [[ -d "/usr/local/sbin/Dotnet" ]]
then
    echo "DOTNET is already installed in your filesystem."
else
    echo "DOTNET does not exist. Installing DOTNET"
    sudo mkdir /usr/local/sbin/Dotnet
	echo "==================DOTNET================================="
	yes | sudo apt-get update
	yes | sudo apt-get upgrade
	sudo apt update
	sudo apt install snapd
	sudo snap install dotnet-runtime-31
	sudo snap install dotnet-sdk --classic --channel=3.1
	sudo snap alias dotnet-sdk.dotnet dotnet
	dotnet --version
	sudo bash /etc/KockpitStudio/Packages/Installer/updatePath.sh
	#dotnet install end
	#dotnet install start
fi

if [[ -d "/usr/local/sbin/supervisor" ]]
then
    echo "SUPERVISOR is already installed in your filesystem."
else
    echo "SUPERVISOR does not exist. Installing SUPERVISOR"
    sudo mkdir /usr/local/sbin/supervisor
	#supervisor install start
	echo "===================SUPERVISOR================================"
	sudo killall apt apt-get;
	sudo apt-get install supervisor -y
	sudo add-apt-repository main 
	sudo add-apt-repository universe 
	sudo add-apt-repository restricted
	sudo add-apt-repository multiverse
	sudo chmod 777 /etc/supervisor/conf.d/
	sudo apt-get install build-essential cmake -y
	sudo apt-get install libuv1.dev -y
	sudo apt-get install build-essential cmake git libjson-c-dev -y
	sudo apt-get install zlib1g-dev -y
	#supervisor install end
fi

if [[ -d "/usr/local/sbin/LIBWEBSOCKET" ]]
then
    echo "LIBWEBSOCKET is already installed in your filesystem."
else
    echo "LIBWEBSOCKET does not exist. Installing LIBWEBSOCKET"
    sudo mkdir /usr/local/sbin/LIBWEBSOCKET
	#libwebsockets install start
	echo "===================LIBWEBSOCKET================================"
	sudo mkdir lib_dir
	cd lib_dir
	sudo git clone https://github.com/warmcat/libwebsockets.git
	cd libwebsockets
	sudo apt-get install libssl-dev
	sudo mkdir build
	cd build
	sudo cmake -DLWS_WITH_LIBUV=1 .. && make
	sudo make install
	sudo ldconfig
	cd
	#libwebsockets install end
fi

if [[ -d "/usr/local/sbin/TTYD" ]]
then
    echo "TTYD is already installed in your filesystem."
else
    echo "TTYD does not exist. Installing TTYD"
    sudo mkdir /usr/local/sbin/TTYD
	#ttyd installation start
	echo "===================TTYD================================"
	sudo mkdir ttyd
	#sudo apt-get install build-essential cmake git libjson-c-dev libwebsockets-dev -y
	sudo git clone https://github.com/tsl0922/ttyd.git
	cd ttyd
	sudo mkdir build
	cd build
	sudo cmake .. && sudo make
	sudo make install
	cd
	#ttyd installation end
fi

if [[ -d "/usr/local/sbin/HTOP" ]]
then
    echo "HTOP is already installed in your filesystem."
else
    echo "HTOP does not exist. Installing HTOP"
    sudo mkdir /usr/local/sbin/HTOP
    echo "===================HTOP================================"
	yes | sudo apt-get install htop;
	sudo chmod +x /usr/local/Script.sh;
fi

if [[ -d "/usr/local/sbin/JUPYTERNOTEBOOK" ]]
then
    echo "JUPYTERNOTEBOOK is already installed in your filesystem."
else
    echo "JUPYTERNOTEBOOK does not exist. Installing JUPYTERNOTEBOOK"
    sudo mkdir /usr/local/sbin/JUPYTERNOTEBOOK
    ######################################################### Installing NOTEBOOK #################################################
	cd "/home/azure/"
	sudo apt-get install unzip -y
	sudo unzip -o /etc/KockpitStudio/Packages/Notebook/notebook64x.tgz -d /etc/KockpitStudio/Packages/Notebook
	sudo apt-get install python3-pip -y
	cd /etc/KockpitStudio/Packages/Notebook/notebook-6.4.x
	sudo python3 -m pip install --upgrade setuptools pip
	sudo python3 -m pip install -e .
	sudo python3 -m pip install p2j
	sudo python3 -m pip install jupyter_contrib_nbextensions
	sudo -E pip install jupyter_contrib_nbextensions
	sudo -E jupyter contrib nbextension install --sys-prefix
	sudo -E jupyter nbextension install /etc/KockpitStudio/Packages/Notebook/notebook-6.4.x/NB_Extn/Querybuilder/
	sudo -E jupyter nbextension enable Querybuilder/main --sys-prefix
	sudo -E jupyter nbextension install /etc/KockpitStudio/Packages/Notebook/notebook-6.4.x/NB_Extn/KockpitVarInspector1/
	sudo -E jupyter nbextension enable KockpitVarInspector1/main --sys-prefix
	sudo -E jupyter nbextension enable execute_time/ExecuteTime --sys-prefix
	sudo unzip -o /etc/KockpitStudio/Packages/Notebook/nbconvert607.tgz -d /etc/KockpitStudio/Packages/Notebook
	sudo unzip -o /etc/KockpitStudio/Packages/Notebook/papermillmain.tgz -d /etc/KockpitStudio/Packages/Notebook
	cd /etc/KockpitStudio/Packages/Notebook/nbconvert-6.0.7
	sudo python3 -m pip install -e .
	cd /etc/KockpitStudio/Packages/Notebook/papermill-main
	sudo python3 -m pip install -e .
	sudo chmod -R 777 /usr/share/jupyter/nbconvert/templates/
	sudo chmod -R 777 /usr/local/share/jupyter/nbconvert/templates/
	################################################################ Notebook Configuration #####################################
	cd "/home/azure/"
	sudo mkdir /home/azure/.jupyter
	sudo chmod 777 /home/azure/.jupyter
	sudo mv /etc/KockpitStudio/Packages/Installer/jupyter_notebook_config.py /home/azure/.jupyter/
	################################################################ Notebook Configuration #####################################
fi


if [[ -d "/usr/local/sbin/supervisorStart" ]]
then
    echo "supervisorStart is already installed in your filesystem."
else
    echo "supervisorStart does not exist. Installing supervisorStart"
    sudo mkdir /usr/local/sbin/supervisorStart
    echo "===================SUPERVISOR CONFIG================================"
	sudo echo -e '[program:ttyd]\ncommand=ttyd -p 5001 bash\nuser=azure\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/ttyd.conf;
	sudo echo -e '[program:healthcheck]\ncommand=ttyd -p 5002 htop\nuser=azure\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/healthcheck.conf;
	sudo echo -e '[program:KockpitLinuxInstallation]\ncommand=ttyd -u 1000 -p 8182 dotnet /etc/KockpitStudio/Packages/Installer/LinuxInstaller.dll\nuser=azure\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/KockpitLinuxInstallation.conf
	#sudo echo -e '[program:KockpitLinuxInstallation]\ncommand=gotty -w -p 8182 bash /usr/local/Script.sh\nuser=azure\nautostart=true\nautorestart=true' > /etc/supervisor/conf.d/KockpitLinuxInstallation.conf
	sudo echo -e '[program:KockpitWebService]\ncommand=dotnet /etc/KockpitStudio/Packages/WebService/KockpitWebService.dll\nautostart=true\nautorestart=true' > sudo /etc/supervisor/conf.d/kockpitwebservice.conf
	sudo echo -e '[program:KockpitWorkerService]\ncommand=dotnet /etc/KockpitStudio/Packages/WorkerService/KockpitWorkerService.dll\nautostart=true\nautorestart=true' > sudo /etc/supervisor/conf.d/KockpitWorkerService.conf
	
	sudo service supervisor stop
	sudo service supervisor start
	sudo ufw allow 5000/tcp
	sudo ufw allow 5001/tcp
	sudo ufw allow 5002/tcp
	sudo ufw allow 5003/tcp
	sudo ufw allow 8182/tcp
fi

echo -e "####Kockpit Signal Abort####"