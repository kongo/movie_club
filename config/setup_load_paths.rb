if ENV['MY_RUBY_HOME'] && ENV['MY_RUBY_HOME'].include?('rvm')
  begin
    rvm_path     = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
    rvm_lib_path = File.join(rvm_path, 'lib')
    require 'rvm'
    RVM.use_from_path! File.dirname(File.dirname(__FILE__))
    RVM.gemset_use! 'movie_club'
  rescue LoadError
    raise "RVM ruby lib is currently unavailable."
  end
end

ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
require 'bundler/setup'
