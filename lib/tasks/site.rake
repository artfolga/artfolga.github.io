require 'middleman-gh-pages'

# namespace :db do
  def generate_cname
    `echo 'artfolga.ru' > CNAME`
  end

  task :after_build_hook do
    at_exit { generate_cname }
  end
# end

  task before_hook: :environment do
    # ENV['RAKE_ENV']['REMOTE_NAME'] = 'artfolga/artfolga.middleman'
    ENV['RAKE_ENV']['BRANCH_NAME'] = 'master_pages'
    puts ENV['RAKE_ENV']['BRANCH_NAME']
  end
  task build:   :before_hook
  task publish: :before_hook

Rake::Task['build'].enhance(['after_build_hook'])

# Rake::Task['build'].enhance do
#   `echo 'artfolga.ru' > CNAME`
# end
