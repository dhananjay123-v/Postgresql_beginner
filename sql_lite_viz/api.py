import requests
import pandas as pd

# === CONFIGURATION ===
API_KEY = '26e6f38b07076cc3660fc9b48ec7128f3cef89e3'  # replace with your actual API key
API_URL = 'https://en-us.topographic-map.com/map-zjtj3q/Manesar/' + API_KEY  # modify based on API
HEADERS = {'Accept': 'application/json'}  # add headers if needed

# === API REQUEST ===
response = requests.get(API_URL, headers=HEADERS)

if response.status_code == 200:
    data = response.json()
    
    # === OPTIONAL: Flatten nested JSON ===
    # This depends on the structure of the API response
    if isinstance(data, dict) and 'results' in data:
        data = data['results']
    
    # Convert to DataFrame
    df = pd.DataFrame([data] if isinstance(data, dict) else data)

    # Save to CSV
    df.to_csv("api_data_manesar.csv", index=False)
    print("✅ Data saved to 'api_data_manesar.csv'")
else:
    print(f"❌ Failed to fetch data. Status code: {response.status_code}")
