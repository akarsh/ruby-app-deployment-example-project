# ruby-app-deployment-example-project

The project `ruby-app-deployment-example-project` contains a web server ruby app written in ruby.

# Table of Contents

- [Installation](#installation)
- [Environment setup](#environment-setup)
- [How is the Gemfile in the project created?](#how-is-the-gemfile-in-the-project-created)
- [Running](#running)
- [Development](#development)
- [Testing](#testing)
- [Docker](#docker)
- [Helm](#helm)
- [Kind](#kind)
- [License](#license)
- [Authors](#authors)
- [Credits](#credits)

## Installation

We assume you are using macOS for developing the projects. Below instructions are designed to work in macOS Sonoma 14.0.

### Environment setup

Install the ruby version managment tool rbenv execute the below command

```
brew install rbenv ruby-build
```

Add rbenv to zsh profile file `.zprofile` in your macOS shell path execute the below command

```
eval "$(rbenv init - zsh)"
```

Install a Ruby version 3.2.2 in rbenv execute the below command

```
rbenv install 3.2.2
```

Set the Ruby version for this directory execute the below command

```
rbenv local 3.2.2
```

Install gem bundler execute the below command

```
gem install bundler
```

If there is an update then update the bundler execute the below command

```
gem update --system 3.4.21
```

### How is the Gemfile in the project created?

Create Gemfile using bundle execute the below command

```
bundle init
```

In the created Gemfile I added the following two gems

```
gem "ruby-lsp"
gem "rubocop"
```

Install the gems in Gemfile using bundle execute the below command

```
bundle install
```

## Running

Set the path in terminal by change the path in terminal to folder `ruby-app`

```
cd ruby-app
```

To run the web server execute the below command

```
ruby http_server.rb
```

After executing the command,

1. Open the URL `http://localhost:80` in browser and you will see message `Well, hello there!`
2. Open the URL `http://localhost/healthcheck` in browser and you will see message `OK`

## Development

We use rubocop for linting and formatting ruby files

Check rubocop offenses in the project execute the below command

```
rubocop
```

To autocorrect fixable rubocop offenses execute the below command

```
rubocop -A
```

## Testing

Unit tests are written in http_server_test.rb

To run unit tests execute the below command

```
ruby http_server_test.rb
```

Expected test output

```
Loaded suite http_server_test
Started
..
Finished in 0.000867 seconds.
------------------------------------------------------------------------------------------------------
2 tests, 2 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
100% passed
------------------------------------------------------------------------------------------------------
2306.81 tests/s, 2306.81 assertions/s
```

## Docker

Build the docker container

```
docker build -t sakarsh/ruby-app-deployment-example-project .
```

Run docker container

```
docker run -t -d -p 80:80 -i sakarsh/ruby-app-deployment-example-project:latest
```

Build and run ruby app with Docker Compose

```
docker compose up -d
```

Stop ruby app with Docker Compose

```
docker compose down
```

## Helm

Install helm chart in minikube

```
helm install ruby-chart rubyap/ --values rubyap/values.yaml
```

Delete helm chart

```
helm delete ruby-chart
```

## Kind

Create a cluster in kind with `config.yaml` file to access the Nodeport service locally

```
kind create cluster --config=config.yaml
```

Access the page locally on http://localhost/
and healthcheck on http://localhost/healthcheck

### License

[LICENSE - GNU GENERAL PUBLIC LICENSE Version 3](LICENSE)

## Authors

[akarsh](https://github.com/akarsh)

### Credits

This project uses Open Source components. You can find the source code of their open source projects along with license information below. We acknowledge and are grateful to these developers for their contributions to open source.
