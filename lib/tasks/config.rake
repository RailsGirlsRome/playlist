namespace :config do
  namespace :heroku do
    class HerokuConfig
      class << self
        def from_env(vars)
          set(vars.inject({ }) { |h, v| h.merge(v => ENV[v]) })
        end

        def set(keyvals)
          "heroku config:set #{keyvals.map { |k, v| "#{k}=#{v}" }.join(" ") }"
        end
      end
    end

    # configure S3
    desc 'Setup heroku s3 environment variables from current environment'
    task :s3 => :environment do
      sh HerokuConfig.from_env(%w{ AWS_S3_ACCESS_KEY_ID AWS_S3_SECRET_ACCESS_KEY })
    end
  end
end
