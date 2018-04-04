#!/usr/bin/env python3
"""Docstring
Python script to write a Python script

Credit goes to Ken Youens-Clark <kyclark@email.arizona.edu> 
with a little copy-editing by Scott Daniel <scottdaniel25@gmail.com>
"""

import argparse
import sys
import os
import re
import subprocess

# --------------------------------------------------
SIMPLE = """#!/usr/bin/env python3
\"\"\"docstring\"\"\"

import os
import sys

args = sys.argv[1:]

if len(args) != 1:
    print('Usage: {} ARG'.format(os.path.basename(sys.argv[0])))
    sys.exit(1)

arg = args[0]

print('Arg is "{}"'.format(arg))
"""

# --------------------------------------------------
ARGPARSE = """#!/usr/bin/env python3
\"\"\"docstring\"\"\"

import argparse
import sys

# --------------------------------------------------
def get_args():
    \"\"\"get args\"\"\"
    parser = argparse.ArgumentParser(description='Argparse Python script')
    parser.add_argument('positional', metavar='str', help='A positional argument')
    parser.add_argument('-a', '--arg', help='A named string argument',
                        metavar='str', type=str, default='')
    parser.add_argument('-i', '--int', help='A named integer argument',
                        metavar='int', type=int, default=0)
    parser.add_argument('-f', '--flag', help='A boolean flag', 
                        action='store_true')
    return parser.parse_args()

# --------------------------------------------------
def main():
    \"\"\"main\"\"\"
    args = get_args()
    str_arg = args.arg
    int_arg = args.int
    flag_arg = args.flag
    pos_arg = args.positional

    print('str_arg = "{}"'.format(str_arg))
    print('int_arg = "{}"'.format(int_arg))
    print('flag_arg = "{}"'.format(flag_arg))
    print('positional = "{}"'.format(pos_arg))

# --------------------------------------------------
if __name__ == '__main__':
    main()
"""

# --------------------------------------------------
def main():
    args = get_args()
    out_file = args.program

    if len(out_file.strip()) < 1:
        print('Not a usable filename "{}"'.format(out_file))
        sys.exit(1)

    out_file = re.sub(r'-', r'_', out_file)
    if not re.search('\.py$', out_file):
        out_file = out_file + '.py'

    if os.path.isfile(out_file) and not args.overwrite:
        yn = input('"{}" exists.  Overwrite? [yN] '.format(out_file))
        if not re.match('^[yY]', yn):
            print('Will not overwrite. Bye!')
            sys.exit()

    fh = open(out_file, 'w')
    text = ARGPARSE if args.use_argparse else SIMPLE
    fh.write(text)
    subprocess.run(['chmod', '+x', out_file])
    print('Done, see new script "{}."'.format(out_file))

# --------------------------------------------------
def get_args():
    """get arguments"""
    parser = argparse.ArgumentParser(description='Create a new Python3 script')
    parser.add_argument('program', help='Program name', type=str)
    parser.add_argument('-a', '--argparse', help='Use argparse',
                        dest='use_argparse', action='store_true')
    parser.add_argument('-f', '--force', help='Overwrite existing',
                        dest='overwrite', action='store_true')
    return parser.parse_args()

# --------------------------------------------------
if __name__ == '__main__':
    main()
