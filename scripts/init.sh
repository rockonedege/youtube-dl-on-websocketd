DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
main=$DIR/async-youtube-dl-master/main.py
chmod +x $main
websocketd --port 30000 --devconsole $main