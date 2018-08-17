# SSM Buildkite Plugin

Inject SSM parameter values as environment variables in build step.

## Usage

Inject `/my/param` as `$MY_PARAM` and `/other/param` as `$OTHER_PARAM`:

```
steps:
  - command: echo "/my/param ${MY_PARAM}"
    plugins:
      unbounce/ssm:
        parameters:
          MY_PARAM: /my/param
          OTHER_PARAM: /other/param
```

## Testing

Test plugin using [buildkite-plugin-tester](https://github.com/buildkite-plugins/buildkite-plugin-tester):

```
docker run -v $(pwd):/plugin buildkite/plugin-tester:latest bats /plugin/tests

# or

docker-compose run tests
```
