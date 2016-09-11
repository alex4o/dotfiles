typeset -U path

export ZLS_COLORS=$LS_COLORS
export NIX_REMOTE=daemon
export GOPATH=$HOME/Source/go-workspace
export TERM=st-256color
export MAKEFLAGS=-j8

export JAVA_HOME=/usr/lib/jvm/default
export ANDROID_HOME=/opt/android-sdk

export QT_QPA_PLATFORMTHEME='qt5ct'  
export QT_STYLE_OVERRIDE='gtk2' 

path=($path /home/alex4o/.gem/ruby/2.3.0/bin /tools/bin /usr/local/bin $GOPATH/bin)

# set32()                                                                                                       ~
# {
#	export LD_LIBRARY_PATH=/home/alex4o/tmp/lib
# }
