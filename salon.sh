#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

# Function to display the list of services
display_services() {
  echo "Please choose one of the following services:"
  echo -e "\n1) Cybersecurity Consulting\n2) Cloud Solutions and Migration\n3) Managed IT Services"
  
}

# Initial display of services
display_services

# Loop until a valid SERVICE_ID_SELECTED is made
while true; do
  read SERVICE_ID_SELECTED
  
  # Check if the SERVICE_ID_SELECTED is valid
  if [[ $SERVICE_ID_SELECTED == 1 || $SERVICE_ID_SELECTED == 2 || $SERVICE_ID_SELECTED == 3 ]]; then
    echo "You selected option $SERVICE_ID_SELECTED."
    case $SERVICE_ID_SELECTED in
      1)
        echo "You selected Cybersecurity Consulting."
        ;;
      2)
        echo "You selected Cloud Solutions and Migration."
        ;;
      3)
        echo "You selected Managed IT Services."
        ;;
    esac
    break  # Exit the loop after a valid SERVICE_ID_SELECTED
  else
    echo "Invalid choice. Please try again."
    display_services  # Re-display the list of services
  fi
done



# get customer info
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
# if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
  # get new customer name
  echo -e "\nWhat's your name?"
  read CUSTOMER_NAME
# insert new customer
INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

echo -e "\nWhen would you like to have a meeting?"
read SERVICE_TIME

#get customer id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# insert appointment
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
#get service info
SERVICE_INFO=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

echo "I have put you down for a $SERVICE_INFO at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."