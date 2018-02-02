#!/usr/bin/env bash
#
# Ystia Forge
# Copyright (C) 2018 Bull S. A. S. - Bull, Rue Jean Jaures, B.P.68, 78340, Les Clayes-sous-Bois, France.
# Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.
#


source ${utils_scripts}/utils.sh
log begin

ensure_home_var_is_set

if isServiceConfigured; then
    log info "MetricBeat component '${NODE}' already configured"
    exit 0
fi

install_dir=${HOME}/${NODE}
config_file=${install_dir}/metricbeat.yml

sed -i -e "s/period:.*$/period: ${PERIOD}/g" ${config_file}

setServiceConfigured
log end
