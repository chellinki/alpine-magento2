# Sharath Chandra Sreenidhi - Alpine based Docker Magento

                                             Alpine based Docker Magento 

## `Installation Steps`: For local environments...

#### A) Clone the repository and change to the repo directory

```bash
git clone https://github.com/chellinki/alpine-magento2.git
cd alpine-magento2
```

#### B) Start the `Traefik` instance

```
docker-compose -f traefik/docker-compose.yml up -d
```

#### C) Start the `Magento2` instance

```
docker-compose -f magento2/sharaths.yml up -d
```

## `Installation Steps`: For production environments...

#### A) Clone the repository and change to the repo directory

```bash
git clone https://github.com/chellinki/alpine-magento2.git
cd alpine-magento2
```

#### B) Setup the Traefik configurations and start the Traefik instance

##### 1) Setup the Traefik configurations 

```
vi traefik.toml
```

> Change `domain = "local.com"` to public domain name which you want to configure and add your emaid-id in `email = "test@test.com"`

Save the file **traefik.toml** and exit from vi editor

```
vi docker-compose.yml
```

> Change `traefik.frontend.rule=Host:traefik.local.com` to the domain name which you have opted for traefik

> Save the file **docker-compose.yml** and exit from vi editor

##### 2) Start the `Traefik` instance

```
docker-compose -f traefik/docker-compose.yml up -d
```

#### C) Configure the sharaths.yml file and  Start the `Magento2 docker` instance

##### 1) Configure the sharaths.yml file 

```
vi magento2/sharaths.yml
```

> Change `traefik.frontend.rule=Host:magento.local.com` to the domain name which you have opted for magento store

> Save the file **sharaths.yml** and exit from vi editor

##### 2) Start the `Magento2 docker` instance

```
docker-compose -f magento2/sharaths.yml up -d
```

