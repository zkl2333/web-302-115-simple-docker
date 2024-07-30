# 使用官方Python镜像作为基础镜像
FROM python:3.11-slim-buster

# 设置工作目录
WORKDIR /app

# 下载 web_115_302_simple.py 文件
# RUN apt-get update && apt-get install -y curl \
#     && curl -o web_115_302_simple.py https://raw.githubusercontent.com/ChenyangGao/web-mount-packs/main/python-115-client/examples/web_115_302_simple.py \
#     && apt-get clean

# 复制脚本文件
COPY web_115_302_simple.py /app/web_115_302_simple.py

# 安装依赖
RUN python3 -m pip install -U blacksheep cachetools orjson pycryptodome uvicorn

# 暴露端口
EXPOSE 80

# 设置入口点
ENTRYPOINT ["python3", "web_115_302_simple.py"]
