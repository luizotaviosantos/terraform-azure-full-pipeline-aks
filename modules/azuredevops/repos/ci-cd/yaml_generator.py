#!/usr/bin/env python3
import sys
from os.path import exists
import requests

APPNAME = sys.argv[1]
DOMAIN = sys.argv[2]
CONTAINER_IMAGE = sys.argv[3]
REGISTRY = sys.argv[4]
NAMESPACE = sys.argv[5]

# IF NAMESPACE IS NOT MAIN, THIS IS NOT A PRODUCTION APP, THEN ADD NAMESPACE SUFFIX

if NAMESPACE != "master":
    APPNAME = "-".join([APPNAME, NAMESPACE])

APPURL="{}.{}".format(APPNAME, DOMAIN)

NAMESPACE_MANIFEST="./manifests/{}.yml".format(NAMESPACE)
APP_MANIFEST="./manifests/{}.yml".format(APPNAME)
if exists(APP_MANIFEST):
    MANIFEST=APP_MANIFEST
elif exists(NAMESPACE_MANIFEST):
    MANIFEST=NAMESPACE_MANIFEST
else:
    print("# ERROR: No manifest found for {} or {}".format(APP_MANIFEST, NAMESPACE_MANIFEST))
    exit(1)

try:
    REGISTRY = sys.argv[4]
except:
    REGISTRY = "luizotavioacr" # HEY! CHANGE THIS!
with open(MANIFEST, 'r') as file:
    DEPLOYMENT = file.read()

DEPLOYMENT = DEPLOYMENT.replace('__APPNAME', APPNAME)
DEPLOYMENT = DEPLOYMENT.replace('__NAMESPACE', NAMESPACE)
DEPLOYMENT = DEPLOYMENT.replace('__APPURL', APPURL)
DEPLOYMENT = DEPLOYMENT.replace('__CONTAINER_IMAGE', CONTAINER_IMAGE)
DEPLOYMENT = DEPLOYMENT.replace('__REGISTRY', REGISTRY)

print(DEPLOYMENT)