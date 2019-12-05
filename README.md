# youtube-dl-on-websocketd
remotely control youtube-dl through websocketd

Run
```bash
docker run --rm -d --name=getyoutube-websocked-service -it \
  -p 30000:30000/tcp \
  -e TZ=Asia/Shanghai \
  -e YDL_PROXY=192.168.1.8:8080
  -v /download:/download \
  youtubedlonwebsocketd:latest
  
```

then visit `http://localhost:30000/`

