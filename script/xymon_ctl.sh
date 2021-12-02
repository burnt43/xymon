#!/bin/bash

function echo_usage {
  cat <<-'EOF'
                                         _   _ 
                                        | | | |
__  ___   _ _ __ ___   ___  _ __     ___| |_| |
\ \/ / | | | '_ ` _ \ / _ \| '_ \   / __| __| |
 >  <| |_| | | | | | | (_) | | | | | (__| |_| |
/_/\_\\__, |_| |_| |_|\___/|_| |_|  \___|\__|_|
       __/ |                                   
      |___/  
Usage: xymon_ctl.sh [OPTIONS]
       xymon_ctl.sh -c Drop -s <hostname> -t <testname>
       xymon_ctl.sh -c Status -s <hostname> -m <message> -t <testname> -l <level>
Options:
  -c   comm       xymon command to execute (Drop, Status)
  -l   level      level(color) for the xymon command (green, yellow, red)
  -m   message    message to accompany the xymon command
  -s   hostname   host from hosts.cfg for the xymon command
  -t   testname   name of the test for the xymon command
EOF
}

function echo_error {
  local msg="$1"

  echo -e "[\033[0;31mERROR\033[0;0m] - $msg"
}

script_dir=$(dirname $0)
ruby_bin=$(which ruby)

[[ ! "${script_dir:0:1}" == "/" ]] && script_dir="./${script_dir}"

app_root_dir="${script_dir}/.."

while getopts "c:hl:m:s:t:" opt; do
  case "$opt" in
    c)
      comm="$OPTARG"
      ;;
    h)
      echo_usage
      exit 0
      ;;
    l)
      level="$OPTARG"
      ;;
    m)
      message="$OPTARG"
      ;;
    s)
      hostname="$OPTARG"
      ;;
    t)
      testname="$OPTARG"
      ;;
  esac
done

[[ -z "$comm" ]] && echo_error "no comm given. use the -c option." && exit 1

case "$comm" in
  Drop)
    [[ -z "$hostname" ]] && echo_error "no hostname given. use the -s option." && echo_usage && exit 1
    [[ -z "$testname" ]] && echo_error "no testname given. use the -t option." && echo_usage && exit 1

    $ruby_bin -I${app_root_dir}/lib -r xymon -e "Xymon::Client::Commands::${comm}.new(hostname: '${hostname}', testname: '${testname}').process"
    ;;
  Status)
    [[ -z "$hostname" ]] && echo_error "no hostname given. use the -s option." && echo_usage && exit 1
    [[ -z "$message" ]] && echo_error "no message given. use the -m option." && echo_usage && exit 1
    [[ -z "$testname" ]] && echo_error "no testname given. use the -t option." && echo_usage && exit 1
    [[ -z "$level" ]] && echo_error "no level given. use the -l option." && echo_usage && exit 1

    $ruby_bin -I${app_root_dir}/lib -r xymon -e "Xymon::Client::Commands::${comm}.new('${testname}', '${level}', '${message}', hostname: '${hostname}').process"
    ;;
esac
