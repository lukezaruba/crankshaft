import os
import sys
import unittest

from mock_plpy import MockPlPy

plpy = MockPlPy()

sys.modules["plpy"] = plpy


def fixture_file(name):
    dir = os.path.dirname(os.path.realpath(__file__))
    return os.path.join(dir, "fixtures", name)
