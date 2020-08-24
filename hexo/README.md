
## build
```
docker build . -t hexo
```

## run

```
docker run --restart=always -d -v /home/me/workspace/wiki.hexo:/mnt -p 4000:4000 hexo server --draft
```

