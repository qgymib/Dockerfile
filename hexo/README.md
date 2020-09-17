
## build
```
docker build . -t hexo
```

## run

```
docker run --restart=always -d -u $(id -u):$(id -g) -v $(pwd):/mnt -p 4000:4000 hexo server --draft
```

