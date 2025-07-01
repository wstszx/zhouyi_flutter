import requests
import json

# API configuration
BASE_URL = 'http://www.zydx.win/@3.0/api.php'
APP_ID = '1751357082'
APP_KEY = '3cf993a74283b97ca06b554ffafc8ba7'
OUTPUT_FILE = 'divination_response.json'

def get_divination_result(name, sex, input_date, city1=None, city2=None, city3=None,
                         sect=None, sylx=None, leixinggg=None, ztys=None, siling=None):
    """
    Calls the divination API and saves the result to a JSON file.

    Args:
        name: 测算名称
        sex: 性别 (0为男，1为女)
        input_date: 日期，格式如：公历2023年11月2日 06时5分
        city1: 真太阳时省地区 (可选)
        city2: 真太阳时市地区 (可选，传入city1时必填)
        city3: 真太阳时县地区 (可选，传入city2时必填)
        sect: 晚子时规则 (可选，1为按明天，2为按当天)
        sylx: 流月 (可选，1为启用)
        leixinggg: 类型标识 (可选，通常为'on')
        ztys: 真太阳时标识 (可选，通常为1)
        siling: 四柱信息标识 (可选，通常为0)
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

    # Add optional parameters if provided
    if city1 is not None:
        params['city1'] = city1
    if city2 is not None:
        params['city2'] = city2
    if city3 is not None:
        params['city3'] = city3
    if sect is not None:
        params['Sect'] = sect
    if sylx is not None:
        params['SYLX'] = sylx
    if leixinggg is not None:
        params['leixinggg'] = leixinggg
    if ztys is not None:
        params['ztys'] = ztys
    if siling is not None:
        params['Siling'] = siling

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
    test_sex = 0  # 0 for male, 1 for female
    # The date format must match the one used in the Flutter app
    # Example: "公历2023年11月20日 06时10分"
    test_input_date = "公历2023年11月2日 06时5分"
    # --------------------------------

    print("=== 基本调用示例 ===")
    get_divination_result(test_name, test_sex, test_input_date)

    print("\n=== 完整参数调用示例 ===")
    # 使用完整参数（对应接口文档示例）
    get_divination_result(
        name="测试",
        sex=0,
        input_date="公历2023年11月2日 06时5分",
        city1="天津",
        city2="天津",
        city3="和平区",
        sect=1,
        sylx=1,
        leixinggg="on",
        ztys=1,
        siling=0
    )
    