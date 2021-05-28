#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2021, yeluyang <ylycpg@qq.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from ansible.module_utils.basic import AnsibleModule

from . import gvm

DOCUMENTATION = r'''
---
'''

EXAMPLES = r'''
'''

RETURN = r'''
'''


def main():
    module = AnsibleModule(
        argument_spec=dict(
            version=dict(type='str', required=True),
        ),
        supports_check_mode=True,
    )

    g = gvm.GVM(module)
    version = module.params["version"]
    g.install(version)
    g.exit()


if __name__ == "__main__":
    main()
