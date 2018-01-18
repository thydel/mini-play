# -*- Mode: ssh-config; -*-

Match host bastion
    HostName the_bastion

Match !originalhost bastion
    HostName %h.the_tld
    ProxyJump bastion
    ForwardAgent yes
