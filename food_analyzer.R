
# SMART FOOD WASTE AND FRESHNESS ANALYZER

# Step 1: Load the dataset
food <- read.csv("Food_Waste.csv")

# Step 2: Display all food records
cat("SMART FOOD WASTE ANALYZER\n")
print(food)

# Step 3: Basic statistics
cat("\nTotal food records:", nrow(food))
cat("\nTotal food quantity (kg):", sum(food$quantity_kg))
cat("\nAverage quantity (kg):", round(mean(food$quantity_kg), 2))

# Step 4: Freshness summary
cat("\n\nFreshness Summary:\n")
print(table(food$freshness))

# Step 5: Category-wise quantity
cat("\nCategory-wise Food Quantity:\n")
category_total <- aggregate(
  quantity_kg ~ category,
  data = food,
  sum
)
print(category_total)

# Step 6: Find the food with maximum quantity
highest <- food[which.max(food$quantity_kg), ]
cat("\nFood with Maximum Quantity:\n")
print(highest)

# Step 7: Display poor freshness food
cat("\nFood Items with Poor Freshness:\n")
poor_food <- subset(food, freshness == "Poor")
print(poor_food)

# Step 8: Bar chart
barplot(
  category_total$quantity_kg,
  names.arg = category_total$category,
  col = c("orange", "skyblue", "lightgreen", "pink"),
  main = "Category-wise Food Quantity",
  xlab = "Food Category",
  ylab = "Quantity (kg)"
)

# Step 9: Histogram
hist(
  food$quantity_kg,
  col = "lightblue",
  main = "Food Quantity Distribution",
  xlab = "Quantity (kg)",
  ylab = "Number of Food Records"
)

cat("\n\nAnalysis completed successfully!\n")


# Step 10: Freshness Analysis Chart

freshness_count <- table(food$freshness)

barplot(
  freshness_count,
  col = c("lightgreen", "orange", "tomato"),
  main = "Food Freshness Analysis",
  xlab = "Freshness Level",
  ylab = "Number of Food Items"
)

# Step 11: High Quantity Food Alert

high_quantity <- subset(food, quantity_kg >= 8)

cat("\nHIGH QUANTITY FOOD ALERT:\n")
print(high_quantity)

cat("\nFreshness chart and quantity alert generated.\n")

