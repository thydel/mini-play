# Creates running setup

```
helper init-play-dir
```

Or any equivalent method to create a minimal `ansible.cfg` and *inventory* setup

# Creates ssh-config

If you need a bastion

```
ssh-config.mk the_bastion=bastion.public the_tld=local
```

Or install your private ssh config

# Gets ansible dependencies

```
make req
```

