SITE_CONFIG = {}
require ARGV.fetch(0)

def expect(actual, expected, message)
  raise "#{message}: expected #{expected.inspect}, got #{actual.inspect}" unless actual == expected
end

expect(Tracks::Config.auth_schemes, [], 'empty schemes')
expect(Tracks::Config.openid_enabled?, false, 'OpenID absent')
expect(Tracks::Config.cas_enabled?, false, 'CAS absent')
expect(Tracks::Config.prefered_auth?, nil, 'empty preference')

SITE_CONFIG['authentication_schemes'] = ['open_id', 'cas']
expect(Tracks::Config.openid_enabled?, true, 'OpenID present')
expect(Tracks::Config.cas_enabled?, true, 'CAS present')
expect(Tracks::Config.prefered_auth?, 'open_id', 'first scheme fallback')

SITE_CONFIG['prefered_auth'] = 'cas'
expect(Tracks::Config.prefered_auth?, 'cas', 'explicit preference')
