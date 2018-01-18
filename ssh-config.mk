#!/usr/bin/make -f

v := bastion tld
. := $(foreach _, $v, $(or $(the_$_), $(error the_$_ is undefined)))
m := $(foreach _, $v, -D the_$_=$(the_$_))
ssh-config: ssh-config.m4 ssh-config.mk; m4 $m $< > $@
