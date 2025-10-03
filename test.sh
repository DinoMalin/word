f() {
  # liste de mots français simples
  mots=("fromage" "baguette" "moustache" "croissant" "escargot" "château" "camembert" "canard" "pastis" "tournesol")
  
  # choisir un mot aléatoire
  mot=${mots[$RANDOM % ${#mots[@]}]}

  # séparer le message en deux parties
  IFS=" " read -r -a arr <<< "$*"
  milieu=$(( ${#arr[@]} / 2 ))
  message=""
  for i in "${!arr[@]}"; do
    if [ "$i" -eq "$milieu" ]; then
      message="$message $mot"
    fi
    message="$message ${arr[$i]}"
  done

  git commit -m "$message"
};

f
