require 'nanoc3/tasks'

desc 'Generate site from Travis CI and publish site to GitHub Pages'
task :travis do
  repo = %x(git config remote.origin.url).gsub(/^git@github.com:/, 'https://github.com/').gsub(/^git:/, 'https:')
  deploy_branch = 'gh-pages'
  if repo.match(/github\.com\.git$/)
    deploy_branch = 'master'
  end
  system "git remote set-url --push origin #{repo}"
  system "git remote set-branches --add origin #{deploy_branch}"
  system 'git fetch -q'
  system "git config --global user.name '#{ENV['GIT_NAME']}'"
  system "git config --global user.email '#{ENV['GIT_EMAIL']}'"
  system 'git config --global credential.helper "store --file=.git/credentials"'
  system 'git config --global push.default matching'
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
  system "git branch #{deploy_branch} origin/#{deploy_branch}"
  system 'cd public && rm -rf * && cd ../'
  system 'bundle exec nanoc compile && cd public && git add -A && git commit -m "Update from travis-ci" && git push && cd ../'
  File.delete '.git/credentials'
end

task :default => [:travis]
