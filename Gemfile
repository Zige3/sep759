source "https://rubygems.org"

ruby "3.3.6"

# ----------------------------------------
# Rails
# ----------------------------------------
gem "rails", "~> 8.1.2"

# ----------------------------------------
# Asset Pipeline
# ----------------------------------------
gem "propshaft"

# ----------------------------------------
# Database
# ----------------------------------------
group :development, :test do
  gem "sqlite3", ">= 2.1"
end

group :production do
  gem "pg"
end

# ----------------------------------------
# Web Server
# ----------------------------------------
gem "puma", ">= 5.0"

# ----------------------------------------
# JavaScript (Importmap)
# ----------------------------------------
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

# ----------------------------------------
# JSON builder
# ----------------------------------------
gem "jbuilder"

# ----------------------------------------
# Timezone support (Windows only)
# ----------------------------------------
gem "tzinfo-data", platforms: %i[windows jruby]

# ----------------------------------------
# Solid adapters (Rails 8 default)
# ----------------------------------------
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# ----------------------------------------
# Boot optimization
# ----------------------------------------
gem "bootsnap", require: false

# ----------------------------------------
# Deployment
# ----------------------------------------
gem "kamal", require: false

# ----------------------------------------
# Active Storage
# ----------------------------------------
gem "image_processing", "~> 1.2"

# ----------------------------------------
# API requests
# ----------------------------------------
gem "httparty"

# ----------------------------------------
# Development tools
# ----------------------------------------
group :development do
  gem "web-console"
end

# ----------------------------------------
# Test tools
# ----------------------------------------
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end