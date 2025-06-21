import json

# Load the JSON file
with open("wild problem -1.json", "r", encoding="utf-8") as f:
    data = json.load(f)

# Access the query field
query_raw = data['inquiries'][0]['query']

# Print decoded SQL query
print(query_raw)
