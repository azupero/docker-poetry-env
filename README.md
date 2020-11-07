# docker-poetry-env
poetryでの分析環境テンプレートです
<br>
<br>
## docker imageの作成
```zsh
$ docker build ./ -t {image_name}
```
## docker containerの作成・起動
```zsh
$ docker run --name {container_name} -it {image_name} /bin/bash
$ docker run --name {container_name} -d -it {image_name} /bin/bash  # -dオプションでバックグラウンド実行
$ docker run --name {container_name} -v $(pwd):/working -it {image_name} /bin/bash  # -vオプションでホストのカレントディレクトリをマウント
```
## docker上のjupyterlabにアクセス
```zsh
$ docker run -p {host_port}:{container_port} --name {container_name} -it {image_name} /bin/bash  # -pオプションでポートフォワードを設定
$ jupyter lab --ip=0.0.0.0 --allow-root
```
## docker-composeを使ったコンテナの作成・起動
```zsh
$ docker-compose up -d
$ docker-compose exec {container_name} /bin/bash
```
