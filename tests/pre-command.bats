#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

# export AWS_STUB_DEBUG=/dev/tty

@test "pre-command runs successfully" {
  stub aws "ssm : echo param-value"

  export BUILDKITE_PLUGIN_AWS_SSM_PARAMETERS_FOO=/foo
  export BUILDKITE_PLUGIN_AWS_SSM_DEBUG=true

  run "/root/projects/ssm-buildkite-plugin/hooks/pre-command"

  assert_success

  assert_output --partial 'Exported FOO as value of parameter /foo'
  assert_output --partial 'Value: param-value'

  unstub aws
}


@test "pre-command with debug off does not print param value" {
  stub aws "ssm : echo param-value"

  export BUILDKITE_PLUGIN_AWS_SSM_PARAMETERS_FOO=/foo

  run "/root/projects/ssm-buildkite-plugin/hooks/pre-command"

  assert_success

  assert_output --partial 'Exported FOO as value of parameter /foo'
  refute_output --partial 'param-value'

  unstub aws
}
