#!/bin/bash
##set -eux


# パッケージのインストール時に、対話形式のユーザーインタフェースを抑制する
export DEBIAN_FRONTEND=noninteractive

pushd ./scripts
./install-openldap.sh
./setup.sh
./install-phpldapadmin.sh
popd
