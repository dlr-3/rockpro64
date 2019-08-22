# rockpro64
pine rockpro64 SBC stuff and things

fanspeed script:

make sure the script fanspeed.sh is executable. run it with sudo like so:

	$ sudo /path/to/script/fanspeed.sh <INTEGER>

	<INTEGER> can be anything between 0 and 100 (0-100 percent fanspeed)

An example unit file is included to start this at boot. change the filepath and input integer accordingly.
To make it start at system boot, run the following commands to drop the unit file in place and enable it:

	mv /path/to/file/fanspeed.service /lib/systemd/system/fanspeed.service
	systemctl enable fanspeed.sh
	systemctl start fanspeed.sh

