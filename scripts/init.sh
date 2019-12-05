DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
websocketd --port 30000 --devconsole $DIR/main.py