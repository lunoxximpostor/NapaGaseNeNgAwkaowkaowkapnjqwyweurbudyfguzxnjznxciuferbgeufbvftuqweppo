{
    "dns": {
        "hosts": {
            "domain:googleapis.cn": "googleapis.com"
        },
        "servers": [
            "8.8.4.4"
        ],
        "tag": "dns"
    },
    "inbounds": [],
    "log": {
        "loglevel": "warning"
    },
    "outbounds": [
        {
            "mux": {
                "concurrency": 8,
                "enabled": true
            },
            "protocol": "socks",
            "settings": {
                "servers": [
                    {
                        "address": "alamathost",
                        "port": 443,
                        "users": [
                            {
                                "level": 8,
                                "pass": "akun",
                                "user": "akun"
#sockwstls
                            }
                        ]
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "tls",
                "tlsSettings": {
                    "allowInsecure": true,
                    "serverName": "alamathost"
                },
                "wsSettings": {
                    "headers": {
                        "Host": "alamathost"
                    },
                    "path": "/admin"
                }
            },
            "tag": "proxy"
        },
        {
            "protocol": "freedom",
            "settings": {},
            "tag": "direct"
        },
        {
            "protocol": "blackhole",
            "settings": {
                "response": {
                    "type": "http"
                }
            },
            "tag": "block"
        }
    ],
    "routing": {
        "domainStrategy": "AsIs",
        "rules": [
            {
                "inboundTag": [
                    "proxy"
                ],
                "outboundTag": "dns",
                "type": "field"
            },
            {
                "inboundTag": [
                    "http"
                ],
                "outboundTag": "proxy",
                "type": "field"
            }
        ]
    }
}