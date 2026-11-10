#!/bin/sh
set -eu

runfiles_root="${TEST_SRCDIR:-$0.runfiles}"
ruby_path="$runfiles_root/$1"
ruby_root="${ruby_path%/bin/ruby}"
test_source="$runfiles_root/$2"
export LD_LIBRARY_PATH="$ruby_root/lib:$ruby_root/openssl/lib"
export RUBYLIB="$ruby_root/lib/ruby/2.2.0:$ruby_root/lib/ruby/2.2.0/x86_64-linux"
exec "$ruby_path" "$test_source"
