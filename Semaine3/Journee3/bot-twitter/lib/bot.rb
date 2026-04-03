# =============================================================
# FICHIER : lib/bot.rb
# RÔLE    : Le cerveau du bot — contient toutes les actions
#           que le bot peut effectuer sur Twitter
# =============================================================

# On charge notre fichier de connexion Twitter
require_relative 'twitter_client'


# =============================================================
# LES DONNÉES : la liste des journalistes et les messages
# =============================================================

# La liste complète des handles de journalistes
# Un "handle" Twitter c'est le @nom d'un compte
JOURNALISTS = [
  "@jcunniet", "@Aziliz31", "@ssoumier", "@marionsouzeau", "@gaellombart",
  "@bendarag", "@AurelieLebelle", "@julienduffe", "@thomaspoupeau", "@LilyRossignol",
  "@ClairGuedon", "@stephanieauguy", "@claw_prolongeau", "@_JulieMenard", "@LColcomb",
  "@Zlauwereys", "@MeLonguet", "@DorotheeLN", "@NolwennCosson", "@ADaboval"
  # ... (liste complète à coller ici)
].freeze
# .freeze rend le tableau immuable : personne ne peut le modifier accidentellement

# Les messages possibles à envoyer (on choisira au hasard parmi eux)
MESSAGES = [
  "Votre travail de journaliste est essentiel pour notre démocratie, merci ! #hello_world @TS_4Afreeka",
  "On suit votre plume avec grand intérêt, continuez comme ça ! #hello_world @TS_4Afreeka",
  "Merci pour votre couverture de l'actu, le journalisme c'est vital ! #hello_world @TS_4Afreeka",
  "Votre dernier article était vraiment top, bravo ! #hello_world @TS_4Afreeka",
  "La liberté de la presse commence avec des journalistes comme vous. Chapeau ! #hello_world @TS_4Afreeka"
].freeze


# =============================================================
# MÉTHODE 1 : tweet_journalists(client, count)
#
# But    : Tweeter un message sympa à "count" journalistes au hasard
# Entrée : client (notre connexion Twitter) + count (combien de tweets)
# Sortie : rien (side effect : envoie des tweets)
#
# SECTION 2.1 de l'exercice
# =============================================================
def tweet_journalists(client, count = 5)

  # .sample(count) choisit "count" éléments AU HASARD dans le tableau
  # sans répétition (pas deux fois le même journaliste)
  selected = JOURNALISTS.sample(count)

  # On boucle sur chaque journaliste sélectionné
  selected.each do |journalist|

    # On choisit un message au hasard parmi nos messages prédéfinis
    # .sample sans argument = 1 élément aléatoire
    message = MESSAGES.sample

    # On construit le tweet final :
    # "#{journalist} #{message}" => ex : "@jcunniet Votre travail est essentiel... #hello_world"
    tweet_text = "#{journalist} #{message}"

    # On envoie le tweet via le client Twitter
    # .update() est la méthode de la gem Twitter pour poster un tweet
    client.update(tweet_text)

    # On affiche dans le terminal ce qu'on vient de tweeter
    # (pour suivre ce que fait le bot en temps réel)
    puts "✅ Tweet envoyé à #{journalist} : #{tweet_text}"

    # On attend 2 secondes entre chaque tweet
    # POURQUOI ? Twitter détecte les comportements de spam.
    # Envoyer 5 tweets en 0.001 secondes = bannissement assuré.
    # On se comporte comme un humain, pas une machine.
    sleep(2)

  end

end


# =============================================================
# MÉTHODE 2 : like_hello_world_tweets(client, count)
#
# But    : Liker les derniers tweets avec #hello_world
# Entrée : client + count (combien de tweets à liker, min 25)
# Sortie : rien (side effect : like des tweets)
#
# SECTION 2.2 de l'exercice
# =============================================================
def like_hello_world_tweets(client, count = 25)

  # client.search() cherche des tweets selon une requête
  # "lang:fr" filtre sur les tweets en français
  # count: 25 demande les 25 derniers résultats
  tweets = client.search("#hello_world lang:fr", count: count)

  # tweets est un objet "lazy" (il charge les données au fur et à mesure)
  # .take(count) récupère les "count" premiers tweets
  tweets.take(count).each do |tweet|

    # On essaie de liker le tweet
    # On utilise begin/rescue pour gérer les erreurs sans planter
    begin

      # .favorite() like le tweet (favorite = ancien nom du like sur Twitter)
      client.favorite(tweet)

      # On affiche ce qu'on a liké pour suivre l'avancement
      puts "❤️  Liké le tweet de @#{tweet.user.screen_name} : #{tweet.text[0..50]}..."

    rescue Twitter::Error::AlreadyFavorited
      # Si on a déjà liké ce tweet, Twitter renvoie une erreur.
      # On la capture ici pour ne pas planter le programme,
      # et on passe simplement au tweet suivant.
      puts "⏭️  Déjà liké, on passe : @#{tweet.user.screen_name}"

    end

    # Pause entre chaque like pour éviter le ban
    sleep(1)

  end

end


# =============================================================
# MÉTHODE 3 : follow_hello_world_users(client, count)
#
# But    : Suivre les personnes ayant tweeté #hello_world
# Entrée : client + count (combien de personnes à suivre, min 20)
# Sortie : rien (side effect : follow des comptes)
#
# SECTION 2.3 de l'exercice
# =============================================================
def follow_hello_world_users(client, count = 20)

  tweets = client.search("#hello_world", count: count)

  tweets.take(count).each do |tweet|

    begin

      # .follow() suit le compte de l'auteur du tweet
      # tweet.user = l'objet représentant l'auteur
      client.follow(tweet.user)

      puts "➕ Suivi @#{tweet.user.screen_name}"

    rescue Twitter::Error::AlreadyFollowing
      # On suit déjà cette personne => on passe au suivant
      puts "⏭️  Déjà suivi @#{tweet.user.screen_name}"

    end

    sleep(1)

  end

end


# =============================================================
# MÉTHODE 4 : stream_hello_world(client)
#
# But    : Surveiller #hello_world EN TEMPS RÉEL et liker+suivre
#          dès qu'un tweet apparaît (comme une sentinelle 24h/24)
# Entrée : client REST + un streaming client séparé
# Sortie : rien (tourne en boucle infinie)
#
# SECTION 2.4 de l'exercice
#
# ATTENTION : Le Streaming client est DIFFÉRENT du REST client.
# REST    = je pose une question, j'attends une réponse, terminé.
# STREAM  = je laisse une connexion ouverte et Twitter m'envoie
#           les tweets AU FUR ET À MESURE qu'ils arrivent.
# =============================================================
def stream_hello_world(rest_client)

  # On crée un client Streaming (différent du REST client)
  # Même configuration, mais classe différente
  streaming_client = Twitter::Streaming::Client.new do |config|
    config.consumer_key        = ENV['TWITTER_API_KEY']
    config.consumer_secret     = ENV['TWITTER_API_SECRET']
    config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
    config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
  end

  puts "🔴 Stream démarré — j'écoute #hello_world en temps réel..."
  puts "   (Ctrl+C pour arrêter)\n\n"

  # .filter(track:) ouvre une connexion permanente à Twitter
  # et appelle le bloc chaque fois qu'un tweet contenant
  # "#hello_world" est posté, en temps réel.
  streaming_client.filter(track: "#hello_world") do |tweet|

    # On vérifie que c'est bien un Tweet (et pas un autre type d'objet
    # que le stream peut envoyer, comme une déconnexion)
    if tweet.is_a?(Twitter::Tweet)

      # On affiche le tweet détecté dans le terminal
      puts "🐦 Nouveau tweet détecté !"
      puts "   Auteur  : @#{tweet.user.screen_name}"
      puts "   Message : #{tweet.text}"
      puts "   ----"

      # On like le tweet avec le client REST (pas le streaming)
      begin
        rest_client.favorite(tweet)
        puts "   ❤️  Liké !"
      rescue Twitter::Error::AlreadyFavorited
        puts "   ⏭️  Déjà liké"
      end

      # On suit l'auteur du tweet
      begin
        rest_client.follow(tweet.user)
        puts "   ➕ Suivi @#{tweet.user.screen_name} !\n\n"
      rescue Twitter::Error::AlreadyFollowing
        puts "   ⏭️  Déjà suivi\n\n"
      end

    end

  end

end