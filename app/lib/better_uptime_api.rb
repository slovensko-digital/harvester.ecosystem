module BetterUptimeApi
  extend self

  BETTER_UPTIME_URL = 'https://betteruptime.com/api/v1/heartbeat/'
  BETTER_UPTIME_ENV_PREFIX = 'BETTER_UPTIME_TOKEN_'

  def ping_heartbeat(heartbeat_name)
    env_token = "#{BETTER_UPTIME_ENV_PREFIX}#{heartbeat_name.upcase}"
    Faraday.get("#{BETTER_UPTIME_URL}#{ENV.fetch(env_token)}") if ENV.key?(env_token)
  end
end
