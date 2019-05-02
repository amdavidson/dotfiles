#! /usr/bin/env python2
from subprocess import check_output

def get_pass():
    return check_output("~/bin/pw.sh IMAP_PASSWORD", shell=True).strip("\n")
