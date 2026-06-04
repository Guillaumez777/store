user = User.find_or_create_by!(email_address: "demo@store.test") do |u|
  u.password = "password"
  u.password_confirmation = "password"
end

[
  "Organiser le bureau",
  "Finaliser la présentation",
  "Appeler le fournisseur",
  "Préparer la newsletter"
].each do |title|
  user.todos.find_or_create_by!(title: title)
end

[
  "Carnet premium",
  "Thé bio du Nepal",
  "Lampe de bureau",
  "Tote bag coton"
].each do |name|
  Product.find_or_create_by!(name: name)
end

puts "✓ Compte démo : demo@store.test / password"
puts "✓ #{user.todos.count} todos et #{Product.count} produits"
