#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n" 

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICE_MENU
  
  read MAIN_MENU_SELECTION

  case $MAIN_MENU_SELECTION in
    1) MAKE_APPOINTMENT 1 ;;
    2) MAKE_APPOINTMENT 2 ;;
    3) MAKE_APPOINTMENT 3 ;;
    4) MAKE_APPOINTMENT 4 ;;
    5) MAKE_APPOINTMENT 5 ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac

  exit
}

MAKE_APPOINTMENT() {
  echo "inside make appointment; service_id is " $1

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$'")
}

SERVICE_MENU(){
  # get services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

MAIN_MENU