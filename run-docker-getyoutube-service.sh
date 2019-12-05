docker run --name=getyoutube-websocked-service -it \
  -p 30000:30000 \
  -e TZ=Asia/Shanghai \
  -e YDL_PROXY=192.168.1.8:3128
  -v /volume2/10t-red/video/youtube:/download \
  continuumio/miniconda3 
  

  