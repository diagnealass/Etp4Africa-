# ============================================================
# SPEC_HELPER.RB - Configuration des tests RSpec
# ============================================================
# Ce fichier configure RSpec avant de lancer les tests.
# Il est chargé automatiquement grâce au fichier .rspec.
# ============================================================

require 'dotenv/load'
require_relative '../lib/app/scrapper'

RSpec.configure do |config|
  # Active la syntaxe "expect" plutôt que l'ancienne syntaxe "should"
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Affiche un avertissement si des tests dépendent d'un ordre précis
  config.order = :random
end