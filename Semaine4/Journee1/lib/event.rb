# =============================================================
# CLASSE EVENT
# Représente un événement dans notre calendrier.
# =============================================================

# "require 'time'" charge la bibliothèque standard Ruby pour
# manipuler les dates et heures. Sans ce require, Time.parse
# ne fonctionnerait pas.
require 'time'

class Event

  # ----------------------------------------------------------
  # attr_accessor pour tous les attributs de l'événement.
  # Cela crée automatiquement les getters et setters pour :
  #   @start_date, @duration, @title, @attendees
  # ----------------------------------------------------------
  attr_accessor :start_date, :duration, :title, :attendees

  # ----------------------------------------------------------
  # INITIALIZE
  # ----------------------------------------------------------
  # Crée un événement avec 4 paramètres.
  # Exemple d'utilisation :
  #   Event.new("2025-06-15 09:00", 30, "Standup", ["a@a.com"])
  #
  # Le paramètre "attendees" a une valeur par défaut : []
  # Cela veut dire qu'on peut créer un événement SANS invités :
  #   Event.new("2025-06-15 09:00", 30, "Standup")
  # Ruby utilisera [] automatiquement si rien n'est fourni.
  # ----------------------------------------------------------
  def initialize(start_date, duration, title, attendees = [])

    # Time.parse() convertit un STRING comme "2025-06-15 09:00"
    # en un objet Time, qui est beaucoup plus puissant :
    # on peut faire des calculs, comparaisons, formatages dessus.
    @start_date = Time.parse(start_date)

    # La durée en minutes (un simple Integer)
    @duration = duration

    # Le titre de l'événement (un String)
    @title = title

    # La liste des participants (un Array de strings/emails)
    @attendees = attendees
  end

  # ----------------------------------------------------------
  # MÉTHODE : postpone_24h
  # ----------------------------------------------------------
  # Décale l'événement de 24 heures vers le futur.
  #
  # Avec les objets Time, on peut additionner des SECONDES.
  # 24 heures = 24 * 60 * 60 = 86400 secondes.
  #
  # @start_date += 86400 est un raccourci pour :
  #   @start_date = @start_date + 86400
  # ----------------------------------------------------------
  def postpone_24h
    @start_date += 86400
  end

  # ----------------------------------------------------------
  # MÉTHODE : end_date
  # ----------------------------------------------------------
  # Calcule et retourne l'heure de FIN de l'événement.
  #
  # Formule : heure_début + durée_en_secondes
  # @duration est en minutes, donc on multiplie par 60
  # pour convertir en secondes (car Time travaille en secondes).
  #
  # Exemple : début à 09:00, durée 30 min → fin à 09:30
  #   Time.parse("09:00") + (30 * 60) = Time(09:30)
  # ----------------------------------------------------------
  def end_date
    @start_date + (@duration * 60)
  end

  # ----------------------------------------------------------
  # MÉTHODE : is_past?
  # ----------------------------------------------------------
  # Retourne TRUE si l'événement est dans le PASSÉ.
  #
  # Time.now = la date et l'heure exactes en ce moment.
  # On compare : est-ce que start_date est AVANT maintenant ?
  #
  # En Ruby, on peut comparer deux Time avec < et > comme
  # on comparerait des nombres. C'est très pratique !
  #
  # Le ? à la fin du nom est une convention Ruby : les méthodes
  # qui retournent true/false ont un nom qui se termine par ?
  # ----------------------------------------------------------
  def is_past?
    @start_date < Time.now
  end

  # ----------------------------------------------------------
  # MÉTHODE : is_future?
  # ----------------------------------------------------------
  # Retourne TRUE si l'événement est dans le FUTUR.
  # C'est simplement l'inverse de is_past?.
  # ----------------------------------------------------------
  def is_future?
    @start_date > Time.now
  end

  # ----------------------------------------------------------
  # MÉTHODE : is_soon?
  # ----------------------------------------------------------
  # Retourne TRUE si l'événement commence dans moins de 30 min.
  #
  # On vérifie deux conditions avec && (= ET) :
  #   1. L'événement est dans le futur (pas encore commencé)
  #   2. La start_date est dans moins de 30 minutes
  #
  # Time.now + (30 * 60) = "dans 30 minutes"
  # Si start_date < "dans 30 minutes", c'est bientôt !
  # ----------------------------------------------------------
  def is_soon?
    is_future? && @start_date < Time.now + (30 * 60)
  end

  # ----------------------------------------------------------
  # MÉTHODE : to_s
  # ----------------------------------------------------------
  # Définit comment afficher l'événement quand on fait puts.
  #
  # Ruby appelle automatiquement to_s quand on fait puts mon_objet.
  # Sans to_s, on verrait un truc illisible comme #<Event:0x0001...>
  #
  # strftime() formate un Time en String lisible.
  # "%d/%m/%Y %H:%M" signifie : jour/mois/année heure:minute
  # Exemple : 2025-06-15 09:00 → "15/06/2025 09:00"
  #
  # .join(", ") transforme le tableau @attendees en String :
  # ["a@a.com", "b@b.com"] → "a@a.com, b@b.com"
  # ----------------------------------------------------------
  def to_s
    puts "================================"
    puts "📅 Titre      : #{@title}"
    puts "🕐 Début      : #{@start_date.strftime("%d/%m/%Y %H:%M")}"
    puts "🕑 Fin        : #{end_date.strftime("%d/%m/%Y %H:%M")}"
    puts "⏱️  Durée      : #{@duration} minutes"
    puts "👥 Invités    : #{@attendees.join(", ")}"
    puts "================================"
  end

end