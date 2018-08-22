# AWS SSM Buildkite Plugin

Inject AWS SSM parameter values as environment variables in build step.

## Usage

Inject `/my/param` as `$MY_PARAM` and `/other/param` as `$OTHER_PARAM`:

```yaml
steps:
  - command: echo "/my/param ${MY_PARAM}"
    plugins:
      unbounce/aws-ssm#v1.0.0:
        region: us-west-2
        parameters:
          MY_PARAM: /my/param
          OTHER_PARAM: /other/param
```

Region is set to `AWS_DEFAULT_REGION` by default, but can be overriden a different value to `region:`

## Testing

Test plugin using [buildkite-plugin-tester](https://github.com/buildkite-plugins/buildkite-plugin-tester):

```
docker run -v $(pwd):/plugin buildkite/plugin-tester:latest bats /plugin/tests

# or

docker-compose run tests
```
