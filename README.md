# Init

## Creates running setup

```
helper init-play-dir
```

Or any equivalent method to create a minimal `ansible.cfg` and *inventory* setup

## Creates ssh-config

If you need a bastion

```
ssh-config.mk the_bastion=bastion.public the_tld=local
```

Or install your private ssh config

```
ssh-config.yml
```

## Gets ansible dependencies

```
make req
```

# Scripts

## users

Usage

```
users.yml -i node, -e file=$users -e id=$trigram -e logname=$name -e use_hg=1 --skip-tags=data
```

with variables

- `file` the name of an user accounts file imported from private repository
- `id` a trigram
- `logname` a login name
- `use_hg` a boolean controlling `hg commit` invocation

- `file` is required
- either `id` or `logname` is required

with tags

- `data` to avoid checking out private user accounts repository
