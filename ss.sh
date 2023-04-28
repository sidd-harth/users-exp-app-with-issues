#!/bin/bash
[[ -n "${TALISMAN_DEBUG}" ]] && DEBUG_OPTS="-d"
CMD="C:/Users/SilentShadow/Downloads/TALISMAN/talisman_windows_amd64.exe ${DEBUG_OPTS} --githook pre-commit"
[[ -n "${TALISMAN_DEBUG}" ]] && echo "ARGS are $@"
[[ -n "${TALISMAN_DEBUG}" ]] && echo "Executing: ${CMD}"
${CMD}
