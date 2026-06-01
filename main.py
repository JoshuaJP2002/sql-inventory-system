import sqlite3

# Connect to the database
connection = sqlite3.connect('inventory_system.db')

# Create a cursor
cursor = connection.cursor()

#  Function to view all products
def view_products():
    cursor.execute("SELECT * FROM products")

    products = cursor.fetchall()

    for product in products:
        print(product)

# Function to add a product
def add_product():
    
    try:
        name = input("Enter product name: ")
        price = float(input("Enter product price: "))
        quantity = int(input("Enter product quantity: "))

        cursor.execute("INSERT INTO products (name, price, quantity) VALUES (?, ?, ?)", (name, price, quantity))

        connection.commit()

        print("Product added successfully!")

    except ValueError:
        print("Invalid input. Please enter correct values.")

# Function to update a product
def update_product():

    try:
        product_id = int(input("Enter product ID to update: "))
        new_price = float(input("Enter new product price: "))

        cursor.execute("UPDATE products SET price = ? WHERE product_id = ?", (new_price, product_id))

        connection.commit()

        print("Product updated successfully!")
        
    except ValueError:
        print("Invalid input. Please enter correct values.")

# Function to delete a product
def delete_product():

    try:
        product_id = int(input("Enter product ID to delete: "))

        cursor.execute("DELETE FROM products WHERE product_id = ?", (product_id,))

        connection.commit()

        print("Product deleted successfully!")
    except ValueError:
        print("Invalid input. Please enter correct values.")

# Function to view customer orders
def view_customer_orders():

    cursor.execute("""
        SELECT customers.first_name,
                products.name,
                order_items.quantity,
                orders.order_date
        FROM order_items
        JOIN orders
            ON order_items.order_id = orders.order_id
        JOIN customers
            ON orders.customer_id = customers.customer_id
        JOIN products
            ON order_items.product_id = products.product_id
    """)

    results = cursor.fetchall()

    print("\nCustomer Orders:")
    print("--------------------------")

    for row in results:
        customer_name = row[0]
        product_name = row[1]
        quantity = row[2]
        order_date = row[3]

        print(f"{customer_name} ordered {product_name} "
              f"(Quantity: {quantity}) on {order_date}")

# Main menu
while True:
    print("\nInventory Management System")
    print("1. View Products")
    print("2. Add Product")
    print("3. Update Product")
    print("4. Delete Product")
    print("5. View Customer Orders")
    print("6. Exit")

    choice = input("Enter your choice: ")

    if choice == '1':
        view_products()
    elif choice == '2':
        add_product()
    elif choice == '3':
        update_product()
    elif choice == '4':
        delete_product()
    elif choice == '5':
        view_customer_orders()
    elif choice == '6':
        print("Exiting the program. Goodbye!")
        break
    else:
        print("Invalid choice. Please try again.")

# Close the database connection
connection.close()