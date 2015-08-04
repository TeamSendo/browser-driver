Gem::Specification.new do |s|
  s.name = 'browser-driver'
  s.version = '0.0.1'
  s.date = '2015-08-04'
  s.summary = 'Wrapper for a web driver (currently Watir)'
  s.authors = ['Feifan Zhou']
  s.email = 'feifan@sendo.me'
  s.files = ['lib/browser_driver.rb']
  s.homepage = 'https://github.com/TeamSendo/browser-driver'

  s.add_dependency 'headless', '~> 2.1.0'
end