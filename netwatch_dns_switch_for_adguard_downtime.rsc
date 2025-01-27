/tool netwatch add comment="Adguard DNS" disabled=no down-script="/ip dns set allow-remote-req uests=yes servers=1.1.1.1\r\
\n:log info \"set DNS to CloudFlare, because Adguard went offline\";" \
host=172.17.0.2 http-codes="" interval=5s port=53 test-script="" type=\

tcp-conn up-script="/ip dns set allow-remote-requests=yes servers=172.17.0.2\r\
\n:log info \"set DNS to Adguard, because it came up\";\r\
\n"
