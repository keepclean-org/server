INTEGRATIONS = %w(
  Brakeman
  BundleAudit
  Danger
  ErbLint
  Flay
  Flog
  LicenseFinder
  RailsBestPractices
  Reek
  Rubocop
  Custom
).map { |name| "#{name}::Integration".constantize }.freeze
