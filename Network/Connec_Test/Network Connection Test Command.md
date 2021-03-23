# Network Connection Test Command



- IP & Port Live check
  - telnet [IP] [PORT]



- network info check 	
  - (Window)  ipconfig  (Linux) ifconfig  
  - option
    -  /all = MAC 주소 확인
    -  /release = ip주소 해제하여 네트웤 연결 단절
    -  /renew = ip주소 갱신하여 재연결
- Using Port Info check
  - netstat
  - option
    - -a : 전체 포트 정보 표시
    - -n : 포트 번호를 숫자로 표시

- DNS check
  - nslookup
- hostname check
  - hostname
- User list check
  - net user
- 상대 호스트의 상태 확인 (icmp 프로토콜 사용)
  - ping [상대 IP] 
- 네트워크 경로 확인 (icmp 프로토콜 사용)
  - (Window) tracert [상대 IP]  (Linux) traceroute
- IP주소 - MAC address 매칭
  - arp -a
- 라우팅 테이블 확인 
  - route print 또는 netstat -nr