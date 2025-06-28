import requests
import json

# API configuration
BASE_URL = 'http://zydx.win/api.php'
APP_ID = '1751103945'
APP_KEY = '1dc133864f00b7ddce0c1bec5e75575b'
OUTPUT_FILE = 'divination_response.json'

def get_divination_result(name, sex, input_date):
    """
    Calls the divination API and saves the result to a JSON file.
    """
    params = {
        'APPID': APP_ID,
        'APPKEY': APP_KEY,
        'api': '101',
        'name': name,
        'sex': sex,
        'DateType': '5',
        'inputdate': input_date,
    }

    try:
        print("Fetching data from API...")
        response = requests.get(BASE_URL, params=params)
        response.raise_for_status()  # Raise an exception for bad status codes (4xx or 5xx)

        print("API call successful. Attempting to parse JSON...")
        
        # Try to parse the JSON response
        try:
            data = response.json()
            
            # Save the formatted JSON to a file
            with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
                json.dump(data, f, ensure_ascii=False, indent=4)

            print(f"Data successfully saved to {OUTPUT_FILE}")

        except json.JSONDecodeError:
            print("Error: Failed to decode JSON from response.")
            print(f"Status Code: {response.status_code}")
            print("Response Text:")
            print(response.text)

    except requests.exceptions.RequestException as e:
        print(f"An error occurred during the API call: {e}")


if __name__ == "__main__":
    # --- User-configurable values ---
    # Replace with the desired input data
    test_name = "测试"
    test_sex = 1  # 1 for male, 0 for female
    # The date format must match the one used in the Flutter app
    # Example: "公历2023年11月20日 06时10分"
    test_input_date = "公历2023年11月20日 06时10分"
    # --------------------------------

    get_divination_result(test_name, test_sex, test_input_date)
    