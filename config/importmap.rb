pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "controllers", to: "controllers.js"
pin_all_from "app/javascript/packs", under: "app"
