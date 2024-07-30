# 使用官方Python镜像作为基础镜像
FROM python:3.10-slim

# 设置工作目录
WORKDIR /app

# 复制脚本文件
COPY web_115_302_simple.py /app/web_115_302_simple.py
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# 安装依赖
RUN pip install blacksheep cachetools orjson pycryptodome

# 暴露端口
EXPOSE 80

# 设置入口点
ENTRYPOINT ["python3", "web_115_302_simple.py"]

# 设置容器启动时运行的命令
CMD ["/app/start.sh"]