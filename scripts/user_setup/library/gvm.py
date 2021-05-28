#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2021, yeluyang <ylycpg@qq.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from typing import Any, List, Dict, Tuple

from ansible.module_utils.basic import AnsibleModule


class GVM:
    def __init__(self, module: AnsibleModule) -> None:
        self.__module = module
        self.__result = dict(
            changed=False,
            failed=False,
            msg="",
            rc=0,
            stdout="",
            stdout_lines=[],
            stderr="",
            stderr_lines=[],
        )

    def check_mode(self) -> bool:
        return self.__module.check_mode

    def check(self) -> None:
        self.exit()

    def install(self, version: str) -> bool:
        cmd = "gvm install {} -B".format(version)
        self.__result["cmd"] = cmd
        return self.__update(*self.__module.run_command(cmd))

    def use(self, version: str) -> bool:
        cmd = "gvm use {} --default".format(version)
        self.__result["cmd"] = cmd
        return self.__update(*self.__module.run_command(cmd))

    def exit(self) -> None:
        if self.__result["failed"]:
            self.__module.fail_json(**self.__result)
        else:
            self.__module.exit_json(**self.__result)

    def __update(self, rc: int, stdout, stderr) -> bool:
        if isinstance(stdout, list):
            self.__result["stdout_lines"] = stdout
        else:
            assert isinstance(stdout, str)
            self.__result["stdout"] = stdout

        if isinstance(stderr, list):
            self.__result["stderr_lines"] = stderr
        else:
            assert isinstance(stderr, str)
            self.__result["stderr"] = stderr

        self.__result["rc"] = rc
        if rc != 0:
            self.__fail()
            return False
        else:
            self.__change()
            return True

    def __change(self) -> None:
        self.__result["changed"] = True

    def __fail(self) -> None:
        self.__result["failed"] = True
