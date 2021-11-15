#!/bin/bash

function echo_error {
  local msg="$1"

  echo -e "[\033[0;31mERROR\033[0;0m] - $msg"
}

script_dir=$(dirname $0)
ruby_bin=$(which ruby)

[[ ! "${script_dir:0:1}" == "/" ]] && script_dir="./${script_dir}"

app_root_dir="${script_dir}/.."

while getopts "c:h:l:m:t:" opt; do
  case "$opt" in
    c)
      comm="$OPTARG"
      ;;
    h)
      hostname="$OPTARG"
      ;;
    l)
      level="$OPTARG"
      ;;
    m)
      message="$OPTARG"
      ;;
    t)
      testname="$OPTARG"
      ;;
  esac
done

[[ -z "$comm" ]] && echo_error "no comm given. use the -c option." && exit 1

case "$comm" in
  Drop)
    [[ -z "$hostname" ]] && echo_error "no hostname given. use the -h option." && exit 1
    [[ -z "$testname" ]] && echo_error "no testname given. use the -t option." && exit 1

    $ruby_bin -I${app_root_dir}/lib -r xymon -e "Xymon::Client::Commands::${comm}.new(hostname: '${hostname}', testname: '${testname}').process"
    ;;
  Status)
    [[ -z "$hostname" ]] && echo_error "no hostname given. use the -h option." && exit 1
    [[ -z "$message" ]] && echo_error "no message given. use the -m option." && exit 1
    [[ -z "$testname" ]] && echo_error "no testname given. use the -t option." && exit 1
    [[ -z "$level" ]] && echo_error "no level given. use the -l option." && exit 1

    $ruby_bin -I${app_root_dir}/lib -r xymon -e "Xymon::Client::Commands::${comm}.new('${testname}', '${level}', '${message}', hostname: '${hostname}').process"
    ;;
esac
