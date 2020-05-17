### Create ssh key pair
```
ssh vagrant@172.16.2.2 'bash -s' < create_key.sh
```

### Allow ssh from specific ip
```
ssh vagrant@10.23.104.51 'bash -s 10.23.106.42' < allow_ssh.sh
```
