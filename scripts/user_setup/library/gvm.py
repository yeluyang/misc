#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2021, yeluyang <ylycpg@qq.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from typing import Any, List, Dict, Tuple

from ansible.module_utils.basic import AnsibleModule

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

    gvm = GVM(module)
    gvm.run()


class GVM:
    def __init__(self, module: AnsibleModule) -> None:
        self.module = module
        self.result = dict(
            changed=False,
            failed=False,
            msg="",
            rc=0,
            stdout="",
            stdout_lines=[],
            stderr="",
            stderr_lines=[],
        )

    def run(self) -> None:
        if self.module.check_mode:
            self._ok()
        version = self.module.params["version"]
        if not self._install(version):
            self._exit()
        if not self._use(version):
            self._exit()

    def _install(self, version: str) -> bool:
        cmd = "gvm install {} -B".format(version)
        self.result["msg"] += cmd+";"
        return self._update(*self.module.run_command(cmd))

    def _use(self, version: str) -> bool:
        cmd = "gvm use {} --default".format(version)
        self.result["msg"] += cmd+";"
        return self._update(*self.module.run_command(cmd))

    def _update(self, rc: int, stdout, stderr) -> bool:
        if isinstance(stdout, list):
            self.result["stdout_lines"].extend(stdout)
        else:
            assert isinstance(stdout, str)
            self.result["stdout_lines"].append(stdout)

        if isinstance(stderr, list):
            self.result["stderr_lines"].extend(stderr)
        else:
            assert isinstance(stderr, str)
            self.result["stderr_lines"].append(stderr)

        self.result["rc"] = rc
        if rc != 0:
            self._fail()
            return False
        else:
            self._change()
            return True

    def _change(self) -> None:
        self.result["changed"] = True

    def _fail(self) -> None:
        self.result["failed"] = True

    def _exit(self) -> None:
        if self.result["failed"]:
            self.module.fail_json(**self.result)
        else:
            self.module.exit_json(**self.result)


if __name__ == "__main__":
    main()
