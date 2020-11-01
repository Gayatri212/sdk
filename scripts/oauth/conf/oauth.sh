#!/bin/bash
#
#  Copyright (c) 2020 General Electric Company. All rights reserved.
#
#  The copyright to the computer software herein is the property of
#  General Electric Company. The software may be used and/or copied only
#  with the written permission of General Electric Company or in accordance
#  with the terms and conditions stipulated in the agreement/contract
#  under which the software has been supplied.
#
#  author: apolo.yasuda@ge.com
#

# PORT indicating a custom environment
if [[ ! -z "${PORT}" ]]; then
  EC_PORT=:$PORT
fi

printenv
cd ~/.ec/oauth/
case $EC_AUTH_VALIDATE in
  oaep)
    echo "launch oauth with oaep"
    agent -cfg ./conf/oauth_oaep.yaml
    ;;
  oidc)
    echo "launch oauth with oidc"
    agent -cfg ./conf/oauth_oidc.yaml
    ;;
  *)
    agent $@
    ;;
esac
