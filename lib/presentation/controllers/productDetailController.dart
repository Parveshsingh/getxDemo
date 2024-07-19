import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class Productdetailcontroller extends GetxController {

// For Map<String, String> this type of data, we can create a model class.
// A model class is used for:
// 1. Data validation
// 2. Type safety
// 3. Better code organization
// 4. Handling null data to avoid runtime errors and etc.

// However, in this specific case, I'm not using a model class because the data is static.
// Since the data is static, I know all details about the data structure,
// and there is no risk of runtime errors due to unexpected or missing data.

  final List<Map<String, dynamic>> products = [
    {
      "id":1,
      "name": "Tomato",
      "weight": "250g",
      "price": 50,
      "image": "https://media.istockphoto.com/id/466175630/photo/tomato-isolated-on-white-background.jpg?s=612x612&w=0&k=20&c=ELzCVzaiRMgiO7A5zQLkuws0N_lvPxrgJWPn7C7BXz0=",
      "description":
      "Tomato is a perennial herbaceous plant but it is often grown as an annual crop even if biennial and perennial forms exist. "
    },
    {"id":2,
      "name": "Apple",
      "weight": "1kg",
      "price": 500,
      "image": "https://www.shutterstock.com/image-photo/red-apple-isolated-on-white-600nw-1727544364.jpg",
      "description": "An apple is a round, edible fruit produced by an apple tree"
    },
    {
      "id":3,
      "name": "Orange Juice",
      "weight": "500ml",
      "price": 550,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_k3dmXxGhAIYtpo1VDWy8SJi30wQqJ5J9Ig&s",
      "description": "Orange juice is a liquid extract of the orange tree fruit, produced by squeezing or reaming oranges."
    },
    {
      "id":4,
      "name": "Combo Pack",
      "weight": "1kg",
      "price": 1000,
      "image": "https://jagsfresh-bucket.s3.amazonaws.com/media/package/img_one/2020-01-24/Monday.jpg",
      "description": "A set of four handcrafted cocktail mixers curated to complement your favorite spirit of choice. Each bottle makes 4 drinks."
    },
    {
      "id":5,
      "name": "Organic Produce",
      "weight": "500g",
      "price": 1500,
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPk_WYoSkuWl5iwL583eb21gqQD1nQCDj7xg&s",
      "description": "'Organic-certified produce' means the food was grown, harvested, stored and transported without the use of synthetic chemicals, irradiation or fumigants."
    },
  ];
}
