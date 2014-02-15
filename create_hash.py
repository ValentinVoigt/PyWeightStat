#!/usr/bin/python3
# -*- encoding: utf-8 -*-

import hashlib
import getpass

while True:
    pw1 = getpass.getpass('Please enter admin password: ')
    pw2 = getpass.getpass('Please enter admin password (again): ')
    if pw1 != pw2:
        print("Passwords do not match. Please try again.")
    else:
        break

myhash = hashlib.sha256(bytes(pw1, 'utf-8')).hexdigest()

print("=" * 50)
print("Add this to your config file:")
print("[app:main]")
print("pyweightstat.admin_password = " + myhash)
print("=" * 50)

