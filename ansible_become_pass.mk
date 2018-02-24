top:; date

~ := ansible_become_pass
$~.mk:;

$~ := {{ lookup('passwordstore', 'ansible/' ~ lookup('env', 'USER') ~ '@' ~ inventory_hostname) }}

define inventory/$~
echo '[$~]';
ls ~/.password-store/ansible | cut -d@ -f2 | cut -d. -f1;
echo '[$~:vars]';
echo "$~ = \"$($~)\""
endef

inventory/$~: $~.mk; ($(strip $($@))) > $@; grep $@ .gitignore || echo $@ >> .gitignore

main: inventory/$~
