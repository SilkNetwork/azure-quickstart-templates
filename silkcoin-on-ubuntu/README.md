# Silkcoin Blockchain Node on Ubuntu VM

This template delivers the Silkcoin network to your VM in about 15 minutes (PPA install).  Everything you need to get started using the Silkcoin blockchain from the command line is included. 
You may select to build from source or install from the community provided Personal Package Archive (PPA).  Once installed, 'silkcoind' will begin syncing the public blockchain. 
You may then connect via SSH to the VM and launch 'silkcoind' to interface with the blockchain.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fsilkcoin-on-ubuntu%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FAzure%2Fazure-quickstart-templates%2Fmaster%2Fsilkcoin-on-ubuntu%2Fazuredeploy.json" target="_blank"><img src="http://armviz.io/visualizebutton.png"/></a>

# What is Silkcoin?

What is Silkcoin?
----------------

Silkcoin is an experimental new digital currency that enables instant payments to anyone, anywhere in the world. Silkcoin uses peer-to-peer technology to operate with no central authority: managing transactions and issuing money are carried out collectively by the network. Silkcoin Core is the name of open source software which enables the use of this currency.


Technical Specifications
---------------------

 - Coin Suffix: SLK
 - Algorithm: Scrypt
 - Full Confirmation: 10 Blocks
 - PoS Target Spacing: 64 Seconds
 - PoS Difficulty Retarget: 10 Blocks
 - PoS Reward: 2 SLK
 - PoS Min: 12 Hours
 - PoS Max: Unlimited
 - PoW Period: 10,000 Blocks
 - PoW Target Spacing: 60 Seconds
 - PoW Difficulty Retarget: 10 Blocks
 - PoW Reward per Block: 0 SLK
 - Total Coins: 2,000,000,000 SLK
 - Block Size: 4MB

Services include:
---------------------
- Decentralized DNS
- Multisig

Links
------------------------
Website: http://www.silknetwork.org

BitcoinTalk: https://bitcointalk.org/index.php?topic=1601099.0

Facebook: https://www.facebook.com/silknetwork/

Twitter: https://twitter.com/silk_network

Waffle: https://waffle.io/silknetwork/silk-core

IRC Channel: https://webchat.freenode.net/?channels=#silknetwork


# Template Parameters

When you click the Deploy to Azure icon above, you need to specify the following template parameters:

* `adminUsername`: This is the account for connecting to your Silkcoin host.
* `adminPassword`: This is your password for the host.  Azure requires passwords to have One upper case, one lower case, a special character, and a number.
* `dnsLabelPrefix`: This is used as both the VM name and DNS name of your public IP address.  Please ensure an unique name.
* `installMethod`: This tells Azure how to install the software.  The default is using the community provided PPA.  You may choose to install from source, but be advised this method takes substantially longer to complete.
* `vmSize`: This is the size of the VM to use.  Recommendations: Use the A series for PPA installs, and D series for installations from source.

# Getting Started Tutorial

* Click the `Deploy to Azure` icon above
* Complete the template parameters, choose your resource group, accept the terms and click Create
* Wait about 15 minutes for the VM to spin up and install the software
* Connect to the VM via SSH using the DNS name assigned to your Public IP
* If you wish to relaunch silkcoind `sudo silkcoind`
* silkcoind will run automatically on restart

# Licensing

Silkcoin is released under the terms of the MIT license. See `COPYING` for more information or see http://opensource.org/licenses/MIT.