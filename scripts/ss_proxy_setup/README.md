# Shadowsocks Proxy Setup

1. edit "proxy_pass" in "group_vars/all.yml"
1. edit "inventory":
   - only add proxy server connected on localhost:1080:
     1. add hosts under group "proxy_on_1080"
   - add more local proxy port:
     1. add new group, named it like "proxy_on_{{PORT}}"
     1. add hosts under new group
     1. create new group vars file "proxy_on_{{PORT}}.yml" in "group_vars/"
     1. set var "proxy_client_port" as "{{PORT}}" like "proxy_client_port: {{PORT}}"
1. run `ansible-playbook main.yml`
