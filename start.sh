#!/bin/bash

# 构建命令行参数
CMD="python3 web_115_302_simple.py -H ${HOST} -p ${PORT}"

if [ "${RELOAD}" = "true" ]; then
    CMD="$CMD -r"
fi

if [ "${VERSION}" = "true" ]; then
    CMD="$CMD -v"
fi

# 执行命令
exec $CMD
