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
```

config.php
```
$CFG->dbtype    = getenv('MOODLE_DB_TYPE') ?: 'pgsql';

$CFG->dbhost    = getenv('MOODLE_DB_HOST') ?: 'localhost';
$CFG->dbname    = getenv('MOODLE_DB_NAME') ?: 'moodle';
$CFG->dbuser    = getenv('MOODLE_DB_USER') ?: 'moodle';
$CFG->dbpass    = getenv('MOODLE_DB_PASSWORD') ?: 'moodle';
$CFG->dbtype    = getenv('MOODLE_DB_TYPE') ?: 'pgsql';

$CFG->wwwroot   = getenv('MOODLE_WWWROOT') ?: 'http://localhost';
```