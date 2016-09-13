#!/bin/bash

set -e 

date
ps axjf


if [ $1 = 'From_Source' ]; then
#################################################################
# Update Ubuntu and install prerequisites for running Silkcoin  #
#################################################################
sudo apt-get update
#################################################################
# Build Silkcoin from source                                    #
#################################################################
NPROC=$(nproc)
echo "nproc: $NPROC"
#################################################################
# Install all necessary packages for building Silkcoin          #
#################################################################
sudo apt-get -y install git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libcrypto++-dev libevent-dev libboost-all-dev
sudo add-apt-repository -y ppa:bitcoin/bitcoin
sudo apt-get update
sudo apt-get install -y libdb4.8-dev libdb4.8++-dev

cd /usr/local
file=/usr/local/Silk-Core
if [ ! -e "$file" ]
then
	sudo git clone https://github.com/SilkNetwork/Silk-Core.git silkcoin
fi

cd /usr/local/Silk-Core
file=/usr/local/silkcoin/src/silkd
if [ ! -e "$file" ]
then
	sudo ./autogen.sh
	sudo ./configure --without-gui
	sudo make -j$NPROC
fi

sudo cp /usr/local/silkcoin/src/silkcoind /usr/bin/silkcoind
sudo cp /usr/local/silkcoin/src/silkcoin-cli /usr/bin/silkcoin-cli

else    
#################################################################
# Install Silkcoin Daemon from PPA                              #
#################################################################
sudo add-apt-repository -y ppa:silknetwork/silkcoin
sudo apt-get update
sudo apt-get install -y silkcoin

fi

################################################################
# Configure to auto start at boot					           #
################################################################
file=$HOME/.silk 
if [ ! -e "$file" ]
then
	sudo mkdir $HOME/.silk
fi
rpcp=$(pwgen -ncsB 35 1)
printf '%s\n%s\n%s\nrpcpassword=%s\n' 'daemon=1' 'server=1' 'rpcuser=silkrpc' $rpcp | sudo tee $HOME/.silk/silk.conf
file=/etc/init.d/silk
if [ ! -e "$file" ]
then
	printf '%s\n%s\n' '#!/bin/sh' 'sudo silkd' | sudo tee /etc/init.d/silk
	sudo chmod +x /etc/init.d/silk
	sudo update-rc.d silk defaults	
fi

/usr/bin/silkd
echo "Silkcoin has been setup successfully and is running..."
exit 0
