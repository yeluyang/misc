#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2021, yeluyang <ylycpg@qq.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from ansible.module_utils.basic import AnsibleModule

DOCUMENTATION = r'''
---
'''

EXAMPLES = r'''
'''

RETURN = r'''
'''


def main():
    result = dict(
        changed=False,
        message='',
    )
    module = AnsibleModule(
        argument_spec=dict(),
        supports_check_mode=True,
    )
    if module.check_mode:
        module.exit_json(**result)
    module.exit_json(**result)


if __name__ == "__main__":
    main()
