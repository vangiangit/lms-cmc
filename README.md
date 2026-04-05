Clear cache build
```
docker builder prune
```

Run image
```
docker run -d -p 8080:80 --network bridge --name my_lmscmc lmscmc_nginx
```

Kiểm tra lỗ hổng trong image
```
docker scout cves <tên_image>
docker scout cves nginx:latest


trivy image alpine:3.15
trivy image <tên_image>
````