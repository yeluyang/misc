# Shadowsocks Proxy Setup

1. edit "proxy_pass" in "group_vars/all.yml"
1. edit "inventory":
   - only add proxy server connected on localhost:1080:
     1. add hosts under group "proxy_on_1080"
   - add more local proxy port:
     1. add new group, named it like "proxy_on_{{PORT}}"
     1. add hosts under new group
     1. set vars to new group, named it like "proxy_on_{{PORT}}:vars"
     1. add vars "proxy_client_port={{PORT}}" under new group vars
1. run `ansible-playbook main.yml`
