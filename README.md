![Screenshot](https://github.com/sprokkel78/unbound-dns-rotate/blob/main/title.png)

Unbound dns will rotate between 4 dns servers at random every 15 min.

1. Place the unbound.conf* files in your unbound directory, probably /etc/unbound.
2. Edit these files according to your preferences.
3. Place the unbound-dns-rotate.sh in your root directory. (must be executable)
4. As root, edit crontab (crontab -e) and add the contents from crontab.txt.
5. done.

Note: "Network based: outgoing tcp port 53 will be blocked for security reasons by iptables."
