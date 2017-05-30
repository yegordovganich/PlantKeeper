import argparse
import os
import subprocess
import sys

sys.path.insert(0, '../material/meta_app/')
import meta_app_utils

meta_app_utils.update(localhost='localhost', localhostPort='80', flowPath='../flow', materialPath='../material', dbname='plantkeeper')