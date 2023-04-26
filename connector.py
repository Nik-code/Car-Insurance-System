import mysql.connector

# Establish a connection to the database
mydb = mysql.connector.connect(
    host="localhost",
    user="username", # Enter your username
    password="passoword", # Enter your password
    database="database_name" # Enter the name of the database
)

# Create a cursor object to execute queries
mycursor = mydb.cursor()

# Table Shape
table_names = {
    "CAR": ("car_ID", "chassis_no", "engine_no", "make", "model", "year"),
    "DRIVER": ("driver_ID", "name", "address", "phone"),
    "OWNER": ("owner_ID", "car_ID", "name", "address", "phone"),
    "POLICY": ("policy_ID", "car_ID", "owner_ID", "start_date", "end_date"),
    "CLAIM": ("claim_ID", "policy_ID", "car_ID", "workshop_ID", "driver_ID", "date", "location", "severity", "amount"),
    "WORKSHOP": ("workshop_ID", "name", "address", "phone")
}


# Add a new record
def add_record():
    global table_names

    # Print the table names
    print("TABLE NAMES\n" + "\n".join(table_names.keys()))

    # Prompt the user to choose a table to add a new record
    table_name = input("Enter the name of the table to update a record: ").upper()
    if table_name not in table_names:
        print("Invalid table name")
        return

    # Prompt the user to enter the field values for the new record
    field_entries = {}
    for field_name in table_names[table_name]:
        field_value = input(f"Enter the value for {field_name}: ")
        field_entries[field_name] = field_value
    values = list(field_entries.values())
    query = f"INSERT INTO {table_name} VALUES ({', '.join(['%s'] * len(values))})"

    # Execute the INSERT query with the values provided by the user
    mycursor.execute(query, values)

    # Commit the changes to the database
    mydb.commit()

    # Print a success message
    print(f"New record added to {table_name}!")


# Update an existing record

def update_record():
    global table_names

    # Print the table names
    print("TABLE NAMES\n" + "\n".join(table_names.keys()))

    # Prompt the user to choose a table to update a record
    table_name = input("Enter the name of the table to update a record: ").upper()
    if table_name not in table_names:
        print("Invalid table name")
        return

    # Prompt the user to enter the primary key ID of the record to update
    pk_name = table_names[table_name][0]
    pk_value = input(f"Enter the {pk_name} of the record to update: ")

    # Prompt the user to enter the new field values for the record
    field_names = table_names[table_name][1:]
    new_values = list(input(f"Enter the new {field_name}: ") for field_name in field_names)

    # Construct the UPDATE query with the new field values and primary key ID
    set_clause = ", ".join([f"{field_name} = %s" for field_name in field_names])
    query = f"UPDATE {table_name} SET {set_clause} WHERE {pk_name} = %s"
    # Execute the UPDATE query with the new values provided by the user
    mycursor.execute(query, tuple(new_values) + (pk_value,))

    # Commit the changes to the database
    mydb.commit()

    # Print a success message
    print(f"Record with {pk_name} {pk_value} updated in {table_name}!")


# Delete a record
def delete_record():
    global table_names

    # Print the table names
    print("TABLE NAMES\n" + "\n".join(table_names.keys()))

    # Prompt the user to choose a table to delete a record
    table_name = input("Enter the name of the table to delete a record: ").upper()
    if table_name not in table_names:
        print("Invalid table name")
        return

    # Prompt the user to enter the primary key ID of the record to delete
    pk_name = table_names[table_name][0]
    pk_value = input(f"Enter the {pk_name} of the record to delete: ")

    # Construct the DELETE query with the primary key ID
    query = f"DELETE FROM {table_name} WHERE {pk_name} = %s"

    # Execute the DELETE query with the primary key ID provided by the user
    mycursor.execute(query, (pk_value,))

    # Commit the changes to the database
    mydb.commit()

    # Print a success message
    print(f"Record with {pk_name} {pk_value} deleted from {table_name}!")


# View all records
def display_records():
    global table_names

    # Print the table names
    print("TABLE NAMES\n" + "\n".join(table_names.keys()))

    # Prompt the user to choose a table to view all records
    table_name = input("Enter the name of the table to view all records: ").upper()
    if table_name not in table_names:
        print("Invalid table name")
        return

    # Construct the SELECT query
    query = f"SELECT * FROM {table_name}"

    # Execute the SELECT query
    mycursor.execute(query)

    # Print the results
    results = mycursor.fetchall()
    for row in results:
        print(row)


# Make queries
def search_records():
    while True:
        # Prompt the user to enter a query
        query = input("Enter a SQL query (or 'quit' to exit): ")

        # If the user enters 'quit', exit the function
        if query == "quit":
            return

        try:
            # Execute the query
            if query.upper().startswith("DROP"):
                print("You are not allowed to drop tables!")
            else:
                mycursor.execute(query)

            # If the query is a SELECT query, print the results
            if query.upper().startswith("SELECT"):
                results = mycursor.fetchall()
                for row in results:
                    print(row)

            # Commit the changes to the database
            mydb.commit()

            # Print a success message
            print("Query executed successfully!")

        except mysql.connector.Error as e:
            # If there is an error, print the error message
            print("Error executing query:", e)



option = ""

while option != "6":

    # Main Menu
    print('''MAIN MENU
1. Add a new record
2. Update an existing record
3. Delete a record
4. Display all records
5. Search for a record (Make queries)
6. Exit''')

    # Prompt the user to choose an option
    option = input("Enter your choice: ")

    # Call the appropriate function based on the user's choice
    if option == "1":
        add_record()
    elif option == "2":
        update_record()
    elif option == "3":
        delete_record()
    elif option == "4":
        display_records()
    elif option == "5":
        search_records()


print("Goodbye!")

