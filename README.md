# README

## Contractor App

Is a web application that allows contractors to request payment from their managers.

### Ruby version
Runs on ruby 3.0.0

### System dependencies
- RabbitMQ 

```bash
brew install rabbitmq
```
- PostgresSQL 
```bash
brew install postgresql
```

* Configuration

### Database creation
```bash
bundle exec rake db:setup
```

### Database initialization
```bash
bundle exec rake db:migrate
bundle exec rake db:seed
```
### How to run the app
```bash
bundle exec rails s
# to start the worker
WORKERS=PaymentResponseWorker rake sneakers:run
```
