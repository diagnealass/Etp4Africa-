number_of_hours_worked_per_day = 10
number_of_days_worked_per_week = 5
number_of_weeks_in_TS4A = 11

# Cette ligne fonctionne car toutes les variables utilisées ont été définies plus haut
puts "Travail : #{number_of_hours_worked_per_day * number_of_days_worked_per_week * number_of_weeks_in_TS4A}"

# Cette ligne va provoquer une erreur
puts "Et en minutes ça fait : #{number_of_minutes_in_an_hour * number_of_hours_worked_per_day * number_of_days_worked_per_week * number_of_weeks_in_TS4A}"