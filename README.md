### clash配置

```
[Unit]
Description=A rule based proxy in Go.
After=network.target

[Service]
Type=exec
Restart=on-abort
ExecStart=/usr/bin/clash -d /etc/clash

[Install]
WantedBy=default.target
```