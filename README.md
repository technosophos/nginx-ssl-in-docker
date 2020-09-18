# Nginx-SSL in Docker

Quick setup to run nginx+SSL in a Docker Container.

This is mainly for testing. It generates a self-signed certificate and then sets up nginx to use that certificate.

## Usage

To generate a TLS self-signed cert/key and then start:

```
$ ./run.sh genkey
```

If you want to run it, but not generate a new key, just do:

```
$ ./run.sh
```

This will start a new HTTPS server in a Docker container bound to https://secure.example.com:4433