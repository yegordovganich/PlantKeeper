import subprocess

cmd = "python ../material/substantiate/substantiatex.py plantkeeper --oauth --generate-dbstate --material-path ../material/ --flow-path ../flow/ --include-dirs ../flow/lib/,../material/ --forbid-dirs plantkeeper/config --compile-only"
returncode = subprocess.call(cmd, shell=True, cwd="..")
if (returncode):
    print("error code %d" % returncode)