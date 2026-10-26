"""Run Vivado component checks and reproduce the original hierarchy blocker.

Default exit status is nonzero while the full imported design cannot elaborate.
Use --components-only for the independently tested comparator and ChipMaze.
"""
import argparse
import os
from pathlib import Path
import subprocess
import sys

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--vivado-bin', type=Path, help='Vivado bin directory; otherwise use PATH')
parser.add_argument('--components-only', action='store_true')
args = parser.parse_args()
repo = Path(__file__).resolve().parents[3]
fpga = repo / 'hardware/fpga'
work = repo / 'build/fpga-review'
work.mkdir(parents=True, exist_ok=True)
step = 0

def run(tool, *arguments):
    global step
    step += 1
    name = tool + ('.bat' if os.name == 'nt' else '')
    executable = str(args.vivado_bin.resolve() / name) if args.vivado_bin else name
    result = subprocess.run([executable, *map(str, arguments)], cwd=work,
                            text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    (work / (f'{step:02d}-' + tool + '-review.log')).write_text(result.stdout, encoding='utf-8')
    print(result.stdout, end='', flush=True)
    return result.returncode

sources = sorted((fpga / 'rtl').glob('*.v')) + sorted((fpga / 'tb/original').glob('*.v'))
if run('xvlog', *sources):
    sys.exit(1)
if run('xvlog', '--sv', fpga / 'tb/review/component_checks.sv'):
    sys.exit(1)
if run('xelab', 'work.component_checks', '--timescale', '1ns/1ps', '-s', 'component_review'):
    sys.exit(1)
if run('xsim', 'component_review', '-runall'):
    sys.exit(1)
simulation_log = work / f'{step:02d}-xsim-review.log'
if 'PASS: 256 comparator vectors and 70400 ChipMaze bit checks' not in simulation_log.read_text(encoding='utf-8'):
    print('Component simulation did not reach the expected pass marker.')
    sys.exit(1)
if not args.components_only:
    status = run('xelab', 'work.sneaky_snake_tb', '-s', 'full_review')
    if status:
        print('Full imported hierarchy is incomplete; see hardware/fpga/REVIEW.md.')
    sys.exit(status)
