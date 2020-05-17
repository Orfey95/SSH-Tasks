### Create ssh key pair
```
ssh vagrant@172.16.2.2 'bash -s' < create_key.sh
```

### Allow ssh from specific ip
```
ssh vagrant@172.16.2.2 'bash -s 172.16.2.3' < allow_ssh.sh
```
