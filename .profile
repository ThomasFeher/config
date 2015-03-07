# Sample .profile for SuSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -z "$PROFILEREAD" && . /etc/profile || true

# Most applications support several languages for their output.
# To make use of this feature, simply uncomment one of the lines below or
# add your own one (see /usr/share/locale/locale.alias for more codes)
# This overwrites the system default set in /etc/sysconfig/language
# in the variable RC_LANG.
#
#export LANG=de_DE.UTF-8	# uncomment this line for German output
#export LANG=fr_FR.UTF-8	# uncomment this line for French output
#export LANG=es_ES.UTF-8	# uncomment this line for Spanish output


# Some people don't like fortune. If you uncomment the following lines,
# you will have a fortune each time you log in ;-)

#if [ -x /usr/bin/fortune ] ; then
#    echo
#    /usr/bin/fortune
#    echo
#fi

#allow users to specify their own ~/.profile
if [ -f ~/.profile.local ]; then
	source ~/.profile.local
fi

#ensure our ssh-agent is running and that our keys are added
eval `ssh-agent` > /dev/null
keys=`ssh-add -l > /dev/null ; echo $?`
if [[ $keys != "0" ]]; then
	ssh-add
fi

#change color temperature of screen according to daytime
(redshift -l 51.03:13.72 -t 6500:3700 &> /dev/null &)

# Neo:                          # Neo Tastaturbelegung
PATH=$PATH:$HOME/neo/    # Neo Tastaturbelegung
export PATH                     # Neo Tastaturbelegung
bone                            # Neo Tastaturbelegung; mit einem # am Zeilenanfang bleibt QWERTZ das Standardlayout, sonst ist es Neo
