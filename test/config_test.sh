#!/bin/sh
set -eu

runfiles_root="${TEST_SRCDIR:-$0.runfiles}"
ruby_root="$runfiles_root/ruby_2_2_10"
export LD_LIBRARY_PATH="$ruby_root/lib:$ruby_root/openssl/lib"
export RUBYLIB="$ruby_root/lib/ruby/2.2.0:$ruby_root/lib/ruby/2.2.0/x86_64-linux"
exec "$ruby_root/bin/ruby" "$runfiles_root/tracks/test/config_test.rb"
