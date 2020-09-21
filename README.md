# multitenant-example
It's a project builded to try the multitency using Django

## Project Quickstart

### Run with docker-compose

0. Clone the repo and cd in
```bash
git clone https://github.com/d3v0l0p3rs/multitenant-example.git
cd getBici
```

1 Change env/dev.env

```bash
POSTGRES_HOST=postgres
POSTGRES_PORT=PORT
POSTGRES_DB=DataBase_Name
POSTGRES_USER=DataBase_User
POSTGRES_PASSWORD=DataBase_PassWord
```

2. `docker-compose build --no-cache`
3. `docker-compose up -d`
4. `docker-compose run django ./manage.py migrate_schemas`
5. `docker-compose run django ./manage.py createsuperuser`
6. `docker-compose run django ./manage.py collectstatic`
8. Browse to `https://127.0.0.1:8000`

---
