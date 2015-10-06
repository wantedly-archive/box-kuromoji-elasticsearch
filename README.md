# Elasticsearch Box [![wercker status](https://app.wercker.com/status/34db4cd9a13b36c0ab61d613328c6b1f "wercker status")](https://app.wercker.com/project/bykey/34db4cd9a13b36c0ab61d613328c6b1f)
A wercker box for elasticsearch with kuromoji plugin.

## GETTING STARTED

```bash
$ git clone https://github.com/wantedly/box-kuromoji-elasticsearch.git && cd box-kuromoji-elasticsearch
$ script/bootstrap
```

## TRYING PROVISIONING
You can try running chef with vagrant.

```bash
$ vagrant up
```

Run Serverspec to test VM environments.


```bash
$ bundle exec rake spec
```
