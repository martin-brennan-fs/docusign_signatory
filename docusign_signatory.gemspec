Gem::Specification.new do |s|
  s.name        = 'docusign_signatory'
  s.version     = '0.0.0'
  s.date        = '2014-07-23'
  s.summary     = "docusign_signatory is a gem for communicating with the DocuSign REST API"
  s.authors     = ["WOLAS Engineering Team"]
  s.email       = 'db@filmskills.com.au'
  s.files       = Dir.glob("{model,lib}/**/*")

  # Add in all dependencies
  s.add_runtime_dependency "httparty", "~> 0"

  s.add_development_dependency "minitest", "~> 0"
  s.add_development_dependency "rake", "~> 0"
end