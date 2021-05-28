#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright: (c) 2021, yeluyang <ylycpg@qq.com>
# GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)

from ansible.module_utils.basic import AnsibleModule


class GVM:
    def __init__(self, module):
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

    def check_mode(self):
        return self.__module.check_mode

    def check(self):
        self.exit()

    def install(self, version):
        cmd = "gvm install {} -B".format(version)
        return self.__update(*self.__module.run_command(cmd))

    def use(self, version):
        cmd = "gvm use {} --default".format(version)
        return self.__update(*self.__module.run_command(cmd))

    def exit(self):
        if self.__result["failed"]:
            self.__module.fail_json(**self.__result)
        else:
            self.__module.exit_json(**self.__result)

    def __update(self, rc, stdout, stderr):
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

    def __change(self):
        self.__result["changed"] = True

    def __fail(self):
        self.__result["failed"] = True
