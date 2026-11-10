#!/bin/sh
set -eu

runfiles_root="${TEST_SRCDIR:-${RUNFILES_DIR:-$0.runfiles}}"
ruby_path="$runfiles_root/$1"
ruby_root="${ruby_path%/bin/ruby}"
test_source="$runfiles_root/$2"
config_source="$runfiles_root/$3"
export LD_LIBRARY_PATH="$ruby_root/lib:$ruby_root/openssl/lib"
export RUBYLIB="$ruby_root/lib/ruby/2.2.0:$ruby_root/lib/ruby/2.2.0/x86_64-linux"
exec "$ruby_path" --disable-gems "$test_source" "$config_source"
