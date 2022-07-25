var items = [
  'En',
  'Fn',
  'Hi',
];
var locationList = ["Home", "Work", "Other"];
List picFavList = [
  {'image': 'icons/desserts.png', 'name': 'Desserts'},
  {'image': 'icons/drinks.png', 'name': 'Drinks'},
  {'image': 'icons/healthy.png', 'name': 'Healthy'},
  {'image': 'icons/non-veg.png', 'name': 'Non-veg'},
  {'image': 'icons/veg.png', 'name': 'Veg'},
  {'image': 'icons/offers.png', 'name': 'Offers'},
  {'image': 'icons/pocket.png', 'name': 'Pocket Friendly'},
];

List picFavFoodList = [
  {'image': 'assets/burgerImage.png', 'name': 'Vada pav'},
  {'image': 'assets/burgerImage.png', 'name': 'Samosa'},
  {'image': 'assets/burgerImage.png', 'name': 'Pani Puri'},
  {'image': 'assets/burgerImage.png', 'name': 'Dosa'},
  {'image': 'assets/burgerImage.png', 'name': 'Jilebi'},
  {'image': 'assets/burgerImage.png', 'name': 'Frankie'},
  {'image': 'assets/burgerImage.png', 'name': 'Falooda'},
  {'image': 'assets/burgerImage.png', 'name': 'shawarma'},
];

List offerList = [
  'assets/offer (1).png',
  'assets/offer (2).png',
  'assets/offer (3).png',
  'assets/offer (4).png',
];

List brandList = [
  {'image': 'assets/dominos.png', 'name': 'Dominos'},
  {'image': 'assets/mcd.png', 'name': "McDonald's"},
  {'image': 'assets/pizzahut.png', 'name': 'Pizza Hut'},
  {'image': 'assets/subway.png', 'name': 'Subway'},
  {'image': 'assets/ccd.png', 'name': 'Cafe Coffee Day'},
  {'image': 'assets/wowmomo.png', 'name': 'Wow Momo'},
  {'image': 'assets/tacobell.png', 'name': 'Taco Bell'},
];

List doneOrderList = [
  {
    'name': "Domino's Pizza",
    'image': 'assets/burgerImage.png',
    'address': 'Goregaon',
    'order': [
      {
        'item_name': 'Double Cheese Margherita',
        'number_of_item': '1',
        'amount': '340'
      },
      {'item_name': 'Veg Loaded', 'number_of_item': '2', 'amount': '540'},
      {'item_name': 'Pepsi', 'number_of_item': '4', 'amount': '60'},
      {'item_name': 'Farmhouse', 'number_of_item': '1', 'amount': '540'},
    ],
    'dc': '130',
    'tax': '50',
    'restro_address': [
      {
        'name': 'FreshMenu',
        'address': '70,Virwani Industrial Easte,Goregaon East,Mumbai'
      }
    ],
    'delivery_address': [
      {
        'name': 'Home',
        'address': 'Raheja height,Room no-1304 ,Goregaon East, Mumbai'
      }
    ],
    'delivery_type': 'COD',
    'total_amount': '2,260',
    'rate': 4,
    'Order_No': 1212090,
    'time': '12:14',
    'date': '23 / 05 / 22',
  },
  {
    'name': "Domino's Pizza",
    'image': 'assets/burgerImage.png',
    'address': 'Goregaon',
    'order': [
      {
        'item_name': 'Double Cheese Margherita',
        'number_of_item': '1',
        'amount': '540'
      },
      {'item_name': 'Farmhouse', 'number_of_item': '1', 'amount': '540'},
    ],
    'dc': '130',
    'tax': '50',
    'restro_address': [
      {
        'name': 'FreshMenu',
        'address': '70,Virwani Industrial Easte,Goregaon East,Mumbai'
      }
    ],
    'delivery_address': [
      {
        'name': 'Home',
        'address': 'Raheja height,Room no-1304 ,Goregaon East, Mumbai'
      }
    ],
    'delivery_type': 'COD',
    'total_amount': '700',
    'rate': 4,
    'Order_No': 1212090,
    'time': '12:14',
    'date': '23 / 05 / 22',
  },
  {
    'name': "Domino's Pizza",
    'image': 'assets/burgerImage.png',
    'address': 'Goregaon',
    'order': [
      {
        'item_name': 'Double Cheese Margherita',
        'number_of_item': '1',
        'amount': '540'
      },
      {'item_name': 'Pepsi', 'number_of_item': '4', 'amount': '40'},
      {'item_name': 'Farmhouse', 'number_of_item': '1', 'amount': '540'},
    ],
    'dc': '130',
    'tax': '50',
    'restro_address': [
      {
        'name': 'FreshMenu',
        'address': '70,Virwani Industrial Easte,Goregaon East,Mumbai'
      }
    ],
    'delivery_address': [
      {
        'name': 'Home',
        'address': 'Raheja height,Room no-1304 ,Goregaon East, Mumbai'
      }
    ],
    'delivery_type': 'COD',
    'total_amount': '1,260',
    'rate': 4,
    'Order_No': 1212090,
    'time': '12:14',
    'date': '23 / 05 / 22',
  },
];

List orderList = [
  {
    'Order_No': 1212090,
    'time': '12:14',
    'item_no': 2,
    "price": 470,
    'rider_name': 'Vinay Hedge',
    'rider_image':
        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
    'rider_number': 2123052313,
    'status': 'Pending',
    'date': '23 / 05 / 22',
  },
  {
    'Order_No': 1212090,
    'time': '14:14',
    'item_no': 2,
    "price": 470,
    'rider_name': 'Vinay Hedge',
    'rider_image':
        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
    'rider_number': 2123052313,
    'status': 'Pending',
    'date': '23 / 05 / 22',
  },
  {
    'Order_No': 1212090,
    'time': '15:14',
    'item_no': 2,
    "price": 470,
    'rider_name': 'Vinay Hedge',
    'rider_image':
        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
    'rider_number': 2123052313,
    'status': 'Pending',
    'date': '23 / 05 / 22',
  },
  {
    'Order_No': 1212090,
    'time': '12:14',
    'item_no': 2,
    "price": 470,
    'rider_name': 'Vinay Hedge',
    'rider_image':
        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
    'rider_number': 2123052313,
    'status': 'Done',
    'date': '23 / 05 / 22',
  },
  {
    'Order_No': 1212090,
    'time': '15:14',
    'item_no': 2,
    "price": 470,
    'rider_name': 'Vinay Hedge',
    'rider_image':
        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
    'rider_number': 2123052313,
    'status': 'Done',
    'date': '23 / 05 / 22',
  },
  {
    'Order_No': 1212090,
    'time': '12:14',
    'item_no': 2,
    "price": 470,
    'rider_name': 'Vinay Hedge',
    'rider_image':
        'https://1.bp.blogspot.com/-arGwhEe2rG0/YTuyVzbS2NI/AAAAAAAAuUU/tKgGGBXs4Ig1kDG63eB8R_CKppQ8HY71QCLcBGAsYHQ/s920/Best-Profile-Pic-For-Boys%2B%25281%2529.png',
    'rider_number': 2123052313,
    'status': 'Done',
    'date': '23 / 05 / 22',
  },
];

List bookingList = [
  {
    'name': 'Xotik Cafe',
    'address': 'Thane',
    'date': '23 / 05 / 22',
    'time': '20:30',
    'count': 03,
    'status': 'Pending'
  },
  {
    'name': 'Butterfly high',
    'address': 'Thane',
    'date': '27 / 05 / 22',
    'time': '20:30',
    'count': 02,
    'status': 'Pending'
  },
  {
    'name': 'Mato Mato',
    'address': 'Thane',
    'date': '30 / 05 / 22',
    'time': '22:30',
    'count': 06,
    'status': 'Pending'
  },
  {
    'name': 'Xotik Cafe',
    'address': 'Thane',
    'date': '23 / 05 / 22',
    'time': '20:30',
    'count': 03,
    'status': 'Pending'
  },
];
