# 🚀 115 直链服务简单且极速版（Docker） 🍳

简单封装 https://github.com/ChenyangGao/web-mount-packs/blob/main/python-115-client/examples/web_115_302_simple.py

### 使用 Docker 运行容器

使用以下命令运行容器，并将 `115-cookies.txt` 文件映射到容器中：

```sh
docker run -p 8998:80 -v path/to/115-cookies.txt:/app/115-cookies.txt ghcr.io/zkl2333/web-302-115-simple-docker:main
```

### 使用 Docker Compose 运行容器

在项目根目录下创建 `docker-compose.yml` 文件，内容如下：

```yaml
version: '3.8'
services:
    web_115_302_simple:
        ports:
            - 8998:80
        volumes:
            - path/to/115-cookies.txt:/app/115-cookies.txt
        image: ghcr.io/zkl2333/web-302-115-simple-docker:main
```


## 原始脚本运行说明

链接格式（每个参数都是可选的）：http://localhost{path2}?pickcode={pickcode}&id={id}&sha1={sha1}&path={path}

- pickcode: 文件的 pickcode，优先级高于 id
- id: 文件的 id，优先级高于 sha1
- sha1: 文件的 sha1，优先级高于 path
- path: 文件的路径，优先级高于 path2
- path2: 文件的路径，这个直接在接口路径之后，不在查询字符串中

### 🌍 环境变量 🛸

- cookies: 115 登录 cookies，优先级高于 cookies_path
- cookies_path: 存储 115 登录 cookies 的文本文件的路径，如果缺失，则从 115-cookies.txt 文件中获取，此文件可以在如下路径之一
    1. 当前工作目录
    2. 用户根目录
    3. 此脚本所在目录 下
- path_persistence_commitment: （传入任何值都视为设置，包括空字符串）路径持久性承诺，只要你能保证文件不会被移动（可新增删除，但对应的路径不可被其他文件复用），打开此选项，用路径请求直链时，可节约一
半时间
- cdn_image: （传入任何值都视为设置，包括空字符串）图片走 cdn，设置此参数会创建一个图片直链的缓存
- cdn_image_warmup_ids: 为图片的 cdn 缓存进行预热，接受文件夹 id，如果有多个用逗号(,)隔开
- cdn_image_warmup_no_path_cache: （传入任何值都视为设置，包括空字符串）为图片的 cdn 缓存进行预热时，不建立路径到 id 的映射，以加快预热速度，但使用路径获取图片时速度慢很多
- url_ttl: 直链存活时间（单位：秒），默认值 1。特别的，若 = 0，则不缓存；若 < 0，则不限时
- url_reuse_factor: 直链最大复用次数，默认值 -1。特别的，若 = 0 或 = 1，则不缓存；若 < 0，则不限次数
- url_range_request_cooldown: range 请求冷却时间，默认值 0，某个 ip 对某个资源执行一次 range 请求后必须过一定的冷却时间后才能对相同范围再次请求。特别的，若 <= 0，则不需要冷却

### 🔨 如何运行 🪛

在脚本所在目录下，创建一个 115-cookies.txt，并把 115 的 cookies 保存其中，格式为

    UID=...; CID=...; SEID=...

然后进入脚本所在目录，运行（默认端口：80，可用命令行参数 -p/--port 指定其它）

    python web_115_302_simple.py

或者（默认端口：8000，可用命令行参数 --port 指定其它）

    uvicorn web_115_302_simple:app

options:
  -h, --help            show this help message and exit
  -H HOST, --host HOST  ip 或 hostname，默认值：'0.0.0.0'
  -p PORT, --port PORT  端口号，默认值：80
  -r, --reload          此项目所在目录下的文件发生变动时重启，此选项仅用于调试
  -v, --version         输出版本号