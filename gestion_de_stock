import tkinter as tk
import mysql.connector

# Établir la connexion à la base de données
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="motdepasse",
    database="store"
)

# Créer une fenêtre principale
window = tk.Tk()
window.title("Gestion de stock")

# Fonction pour récupérer tous les produits depuis la base de données
def get_products():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM product")
    products = cursor.fetchall()
    return products

# Fonction pour ajouter un produit à la base de données
def add_product():
    name = name_entry.get()
    description = description_entry.get()
    price = price_entry.get()
    quantity = quantity_entry.get()
    category = category_entry.get()

    cursor = db.cursor()
    sql = "INSERT INTO product (name, description, price, quantity, id_category) VALUES (%s, %s, %s, %s, %s)"
    values = (name, description, price, quantity, category)
    cursor.execute(sql, values)
    db.commit()
    refresh_product_list()

# Fonction pour supprimer un produit de la base de données
def delete_product():
    selected_product = product_listbox.get(product_listbox.curselection())
    product_id = selected_product.split(" - ")[0]

    cursor = db.cursor()
    sql = "DELETE FROM product WHERE id = %s"
    value = (product_id,)
    cursor.execute(sql, value)
    db.commit()
    refresh_product_list()

# Fonction pour mettre à jour un produit dans la base de données
def update_product():
    selected_product = product_listbox.get(product_listbox.curselection())
    product_id = selected_product.split(" - ")[0]
    new_quantity = new_quantity_entry.get()

    cursor = db.cursor()
    sql = "UPDATE product SET quantity = %s WHERE id = %s"
    values = (new_quantity, product_id)
    cursor.execute(sql, values)
    db.commit()
    refresh_product_list()

# Fonction pour rafraîchir la liste des produits
def refresh_product_list():
    products = get_products()
    product_listbox.delete(0, tk.END)
    for product in products:
        product_listbox.insert(tk.END, f"{product[0]} - {product[1]} ({product[4]} en stock)")

# Afficher la liste des produits
product_listbox = tk.Listbox(window, width=50)
product_listbox.pack()
refresh_product_list()

# Ajouter un produit
add_frame = tk.Frame(window)
add_frame.pack()

name_label = tk.Label(add_frame, text="Nom:")
name_label.grid(row=0, column=0)
name_entry = tk.Entry(add_frame)
name_entry.grid(row=0, column=1)

description_label = tk.Label(add_frame, text="Description:")
description_label.grid(row=1, column=0)
description_entry = tk.Entry(add_frame)
description_entry.grid(row=1, column=1)

price_label = tk.Label(add_frame, text="Prix:")
price_label.grid(row=2, column=0)
price_entry = tk.Entry(add_frame)
price_entry.grid(row=2, column=1)

quantity_label = tk.Label(add_frame, text="Quantité:")
quantity_label.grid(row=3, column=0)
quantity_entry = tk.Entry(add_frame)
quantity_entry.grid(row=3, column=1)

category_label = tk.Label(add_frame, text="Catégorie:")
category_label.grid(row=4, column=0)
category_entry = tk.Entry(add_frame)
category_entry.grid(row=4, column=1)

add_button = tk.Button(add_frame, text="Ajouter", command=add_product)
add_button.grid(row=5, column=0, columnspan=2)

# Supprimer un produit
delete_button = tk.Button(window, text="Supprimer", command=delete_product)
delete_button.pack()

# Mettre à jour la quantité d'un produit
update_frame = tk.Frame(window)
update_frame.pack()

new_quantity_label = tk.Label(update_frame, text="Nouvelle quantité:")
new_quantity_label.grid(row=0, column=0)
new_quantity_entry = tk.Entry(update_frame)
new_quantity_entry.grid(row=0, column=1)

update_button = tk.Button(update_frame, text="Mettre à jour", command=update_product)
update_button.grid(row=1, column=0, columnspan=2)

# Lancer l'application
window.mainloop()