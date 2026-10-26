"""Integration checks against an already built executable (Python 3)."""
from pathlib import Path
import subprocess
import sys
import tempfile

exe = str(Path(sys.argv[1]).resolve())

def run(path, threshold, threads=1):
    return subprocess.run([exe, str(path), str(threshold), str(threads)],
                          text=True, capture_output=True, check=False)

def counts(result):
    assert result.returncode == 0, result.stderr
    values = dict(line.split(': ', 1) for line in result.stdout.splitlines())
    return tuple(int(values[k]) for k in
                 ('Total Reads', 'Total Accepted Reads', 'Total Rejected Reads'))

with tempfile.TemporaryDirectory() as directory:
    path = Path(directory) / 'pairs.txt'
    path.write_text('ACGT ACGT\nAAAA TTTT\nACGT ACGA\n')
    assert counts(run(path, 0)) == (3, 1, 2)
    assert counts(run(path, 1)) == (3, 2, 1)
    path.write_text('ACGT ACGT\nAAAA TTTT\nACGT ACGA\n' * 1000)
    assert counts(run(path, 1, 1)) == counts(run(path, 1, 4)) == (3000, 2000, 1000)
    for text in ('', '\n', 'ACGT ACG\n', 'ACGT ACGT extra\n', 'acgt ACGT\n'):
        path.write_text(text)
        assert run(path, 0).returncode != 0, repr(text)
    path.write_text('ACGT ACGT\n')
    for threshold, threads in [(-1, 1), ('x', 1), (0, 0), ('1x', 1)]:
        assert run(path, threshold, threads).returncode != 0
    assert run(Path(directory) / 'missing.txt', 0).returncode != 0
print('Runner checks passed: basic counts, parallel consistency, and invalid input.')
